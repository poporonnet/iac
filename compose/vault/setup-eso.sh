#!/usr/bin/env bash
# VaultをESO(External Secrets Operator)と連携させるためのセットアップスクリプト
# 実行前にVaultが起動済みかつunseal済みであること
set -euo pipefail

VAULT_ADDR="${VAULT_ADDR:-http://127.0.0.1:8200}"
VAULT_TOKEN="${VAULT_TOKEN:?VAULT_TOKENを設定してください}"
ESO_POLICY_NAME="eso-policy"
APPROLE_NAME="eso"
SECRET_PATH="secret"

export VAULT_ADDR VAULT_TOKEN

echo "==> KVv2シークレットエンジンを有効化"
vault secrets enable -path="${SECRET_PATH}" kv-v2 2>/dev/null || echo "既に有効です"

echo "==> ESO用ポリシーを作成"
vault policy write "${ESO_POLICY_NAME}" - <<EOF
path "${SECRET_PATH}/data/*" {
  capabilities = ["read"]
}

path "${SECRET_PATH}/metadata/*" {
  capabilities = ["read", "list"]
}
EOF

echo "==> AppRole認証を有効化"
vault auth enable approle 2>/dev/null || echo "既に有効です"

echo "==> ESO用AppRoleを作成"
vault write "auth/approle/role/${APPROLE_NAME}" \
  token_policies="${ESO_POLICY_NAME}" \
  token_ttl=1h \
  token_max_ttl=4h \
  secret_id_ttl=0

echo "==> RoleIDとSecretIDを取得"
ROLE_ID=$(vault read -field=role_id "auth/approle/role/${APPROLE_NAME}/role-id")
SECRET_ID=$(vault write -f -field=secret_id "auth/approle/role/${APPROLE_NAME}/secret-id")

echo ""
echo "=========================================="
echo "ESO ClusterSecretStore用の認証情報:"
echo "  ROLE_ID:   ${ROLE_ID}"
echo "  SECRET_ID: ${SECRET_ID}"
echo "=========================================="
echo ""
echo "k8sにSecretを作成:"
echo "  kubectl create secret generic vault-approle \\"
echo "    --from-literal=roleId=${ROLE_ID} \\"
echo "    --from-literal=secretId=${SECRET_ID} \\"
echo "    -n external-secrets"
