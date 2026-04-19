## 設定の書き方

`records.tf`: DNSレコードを記述するファイル．

> [!IMPORTANT]
> cloudflare DNSのダッシュボードは操作しないでください．`records.tf`との整合性がとれなくなります．

以下の通りに設定を書きます:

```terraform
resource "cloudflare_dns_record" "RESOURCE_NAME" {
  comment  = "コメント．設定内容には関係ない"
  content  = "IPアドレスなど，レコードの設定内容"
  name     = "FQDN"
  # Cloudflare CDNでプロキシするか
  proxied  = false
  tags     = []
  # ttlは触らない
  ttl      = 1 
  # レコード種類．設定可能な種類はドキュメント参照．
  type     = "A"
  # poporon.orgのCloudflare上でのID．
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  # このままにしておく
  settings = {}
}
```

- `terraform plan`: 設定の内容を確認
- `terraform apply`: 設定を反映

