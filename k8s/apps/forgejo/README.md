# Forgejoの初回デプロイ

Forgejoは旧Giteaデータの移行が終わるまで0 replicasでデプロイされる。
`kustomization.yaml`末尾のpatchがDeploymentを停止している。

## Vault

Vaultの`forgejo`に次のpropertyを登録する。

- `database_password`
- `secret_key`
- `internal_token`
- `oauth2_jwt_secret`
- `lfs_jwt_secret`

`secret_key`は旧Giteaの`security.SECRET_KEY`を引き継ぐ。
既存の暗号化済みデータを復号できなくなるため、新しい値へ変更しない。

残りのtokenも、既存tokenを維持する場合は旧`app.ini`の値を引き継ぐ。

Vaultの`valkey`には、URLへ埋め込める十分に長い`password`を登録する。
External Secrets OperatorがURLエンコードするため、記号を含むpasswordも利用できる。

## データ移行

旧Giteaを停止し、PostgreSQLの`gitea` databaseへの接続が残っていないことを確認したうえで、`gitea`をtemplateにした`forgejo` databaseを作成する。

```console
CREATE DATABASE forgejo TEMPLATE gitea OWNER gitea;
```

`TEMPLATE`はcopy元databaseへの接続が一切無い状態でないと失敗するため、旧Giteaの停止と接続確認が前提になる。
また`gitea` USERはCREATEDB権限を持たないため、`postgres`等の管理者roleで実行する。

Forgejoの`kustomization.yaml`は`database.NAME`にこの`forgejo` databaseを指す。
元の`gitea` databaseはコピー後も変更されないため、Forgejoの初回起動によるschema migrationが失敗しても、`forgejo` databaseを作り直せばやり直せる。

同じ停止状態で、旧Giteaのデータを保持するLonghorn volume `gitea`のsnapshotも、Longhorn UIまたは`longhorn.io/v1beta2 Snapshot`リソースで取得する。

取得したsnapshot名を[source-volume.yaml](./../../migrations/gitea-to-forgejo/source-volume.yaml)の`dataSource`（`snap://gitea/<snapshot名>`）へ反映する。
このsnapshot名は日時を含む固定値であり使い回せないため、migration Jobを適用するたびに実際に取得したsnapshotの名前へ書き換える。
`source-pv.yaml`/`source-pvc.yaml`の`storage`容量も、必要に応じて`gitea` volumeの実サイズに合わせて調整する。

旧GiteaからForgejo 15へ直接更新できるversionかも、初回起動前にForgejoのupgrade pathで確認する。
直接更新できない場合は、対応する中間versionを経由する。

Argo CDが`longhorn-retain`、Valkey、ForgejoのPVCを作成し、両PVCが`Bound`になった後、migration Jobを手動で適用する。

```console
kubectl apply -k k8s/migrations/gitea-to-forgejo
kubectl wait --for=condition=complete --timeout=10m job/gitea-to-forgejo -n forgejo
kubectl logs job/gitea-to-forgejo -n forgejo
kubectl delete -k k8s/migrations/gitea-to-forgejo
```

Jobは保全snapshotから一時Longhorn volumeをcloneし、repository、LFS、attachment、avatar、package、Actionsデータを新しいRWX volumeへコピーする。
旧`app.ini`、session、queue、indexer、SSH host keyはコピーしない。

Jobはin-progress markerを使うため、コピー中に失敗した場合は同じJobのretryで再開できる。
complete markerがある状態では再実行しない。

一時リソースを削除しても、元の`gitea` volumeとsnapshotは残る。

## 起動

移行後に`kustomization.yaml`末尾のDeployment patchを削除する。
Argo CDの同期後、Forgejoが1 replicaで起動してDB migrationを実行する。

HTTPSの動作、repository、avatar、clone、pushを確認するまで、旧Gitea volumeとsnapshotは削除しない。
同じ期間、PostgreSQLの元`gitea` databaseも削除しない。

SSH ServiceはClusterIPであり、クラスタ外には公開していない。
SSHを公開するときはTraefikのTCP entrypointとSSH host keyの移行またはfingerprint変更の周知が必要になる。

## Secretの更新

External Secrets OperatorによるSecret更新だけでは、実行中のForgejoとValkeyに新しい値は反映されない。
passwordやtokenを変更するときは、PostgreSQL、Valkey、Vaultを整合させたうえで両Deploymentを計画的に再起動する。

## 将来の複数replica化

Forgejo chartは複数replicaを正式なHA構成として保証していない。
検証する場合は、少なくとも次の変更が必要になる。

- ValkeyをSentinelまたはCluster構成へ変更する
- `cron.GIT_GC_REPOS.ENABLED`を`false`にする
- DB migrationを単一PodまたはJobで実行する
- PodDisruptionBudgetを追加する
- RWX障害時と同時push時の動作を確認する
