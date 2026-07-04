# terraformのstateを保存するR2バケット
resource "cloudflare_r2_bucket" "tfstate" {
  account_id = var.cloudflare_account_id
  name       = "dns-iac-tfstate"
  location   = "APAC"
}
