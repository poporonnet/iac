# Forgejo Runner

KEDAが`ubuntu-latest`ラベルの待機ジョブ数を監視し、ジョブごとにForgejo Runner Podを作成する。
待機ジョブがない場合、Runner Podは0個になる。

Runnerは公式イメージの`one-job`モードで動作する。
各Podは専用のDocker-in-Docker daemonを持ち、別のジョブやクラスタノードのDocker daemonを共有しない。
Docker-in-Dockerには`privileged`が必要なため、このnamespaceだけPod Security Standardsの`privileged`を許可している。

## Runnerの登録

Forgejoの`/admin/actions/runners`でinstance全体を対象とするpersistent Runnerを作成する。
Runner名には`kubernetes-runner`を指定し、ephemeral modeは有効にせず、表示されたUUIDとtokenを控える。

KEDAがinstance全体の待機ジョブAPIを参照するため、site administratorの設定画面から`read:admin` scopeを持つForgejo API tokenも作成する。

Vaultの`forgejo-runner`に次のpropertyを登録する。

- `runner_uuid`：Runner作成時に表示されたUUID
- `runner_token`：Runner作成時に表示されたtoken
- `api_token`：KEDAが待機ジョブAPIを参照するためのForgejo API token

Runnerの登録scope、Runner名、ラベルは`scaled-job.yaml`のForgejo scaler設定と一致させる必要がある。

## 動作確認

Argo CDで`keda`と`forgejo-runner`が同期された後、次のworkflowを対象repositoryへ追加する。

```yaml
on: push
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: docker version
```

workflowを実行すると`forgejo-runner` namespaceにJobとPodが作成され、完了後にPod数が0へ戻る。

```console
kubectl get scaledjob,job,pod -n forgejo-runner
```
