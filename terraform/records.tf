resource "cloudflare_dns_record" "terraform_managed_resource_c43c2de31a0100c1497475ffb8f1a736_0" {
  comment  = "Gitea(PROD)用/管理者: @laminne"
  content  = "116.80.80.106"
  name     = "git.poporon.org"
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "A"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

resource "cloudflare_dns_record" "terraform_managed_resource_8f90ea62a94daeb74c7a6a8eb84f3d44_1" {
  comment  = "Authentik(PROD)用/管理者: @laminne"
  content  = "172.234.80.75"
  name     = "id.poporon.org"
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "A"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

resource "cloudflare_dns_record" "terraform_managed_resource_d1c7196539db6fbe870343dd28af21ad_2" {
  comment  = "ilu-t用 / 管理: @laminne"
  content  = "116.80.80.106"
  name     = "ilu-t.poporon.org"
  proxied  = true
  tags     = []
  ttl      = 1
  type     = "A"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

resource "cloudflare_dns_record" "terraform_managed_resource_b58f9a72876bd7a7d0d6ba1ddbc0878b_3" {
  comment  = "Gitea(PROD)用/管理者: @laminne"
  content  = "2400:8905::2000:daff:fe2a:9bbd"
  name     = "git.poporon.org"
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "AAAA"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

resource "cloudflare_dns_record" "terraform_managed_resource_92a381c42beb7b8ecda6de95b6635a46_4" {
  content = "3c1920ab-2c32-45b0-9aa2-48c6a8c3c32c.cfargotunnel.com"
  name    = "kanicc.poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_6b69e0e036db102dcfc91b13b43327d2_5" {
  content = "kaniwriter.pages.dev"
  name    = "kaniwriter.poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_b74d84fc6cb95b28ea96ad49e502cfc8_6" {
  content = "4679e966-3078-442a-85e3-f8ef0d1b05b3.cfargotunnel.com"
  name    = "kcms.poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_7e41954f5d01910ca4002460f5a7bb0d_7" {
  content = "4679e966-3078-442a-85e3-f8ef0d1b05b3.cfargotunnel.com"
  name    = "kcmsx.poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_487577e8146726f96ee888fc3508b0ce_8" {
  content = "3c1920ab-2c32-45b0-9aa2-48c6a8c3c32c.cfargotunnel.com"
  name    = "memos.poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_949280f0c2bc312cbb9749f02ec12dca_9" {
  content = "3c1920ab-2c32-45b0-9aa2-48c6a8c3c32c.cfargotunnel.com"
  name    = "note.poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_2cfa8215ac78b48c962579b3b031c5e9_10" {
  content = "3c1920ab-2c32-45b0-9aa2-48c6a8c3c32c.cfargotunnel.com"
  name    = "penpot.poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_1bac0f6a412dba0b50404b0d55c87327_11" {
  content = "poporonnet.github.io/pmt/"
  name    = "pmt.poporon.org"
  proxied = false
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_ea3d30e59ce916de18c89ebd0e7eaa4a_12" {
  content = "poporon-org.pages.dev"
  name    = "poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_c9e1e1a32b9f0fe2415ac87fc90ee2aa_13" {
  content = "3c1920ab-2c32-45b0-9aa2-48c6a8c3c32c.cfargotunnel.com"
  name    = "zitadel_login_v2.poporon.org"
  proxied = true
  tags    = []
  ttl     = 1
  type    = "CNAME"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
    flatten_cname = false
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_29113b078f52ab918343d727172fb511_14" {
  content = "133.18.124.103"
  name    = "zitadel.poporon.org"
  proxied = false
  tags    = []
  ttl     = 1
  type    = "A"
  zone_id = "878133051abf4697f6c4151e0b8b425a"
  settings = {
  }
}

resource "cloudflare_dns_record" "terraform_managed_resource_583381c99dd79b3d173d2bd085da60a0_15" {
  content  = "C0AKcv_1Dix2C8oTm9SXV3_85dlj5BaXNpHjKfjknwo"
  name     = "_acme-challenge.git.poporon.org"
  proxied  = false
  tags     = []
  ttl      = 120
  type     = "TXT"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

resource "cloudflare_dns_record" "terraform_managed_resource_9bbdadd9cb82a7fe3491f7f3df26933b_16" {
  content  = "OS8ZDJLDL8nQNgCBRfkbDeGXGxm8Gv1KovOrspASLCo"
  name     = "_acme-challenge.id.poporon.org"
  proxied  = false
  tags     = []
  ttl      = 120
  type     = "TXT"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

resource "cloudflare_dns_record" "terraform_managed_resource_797304e6d54907c044cf0ff50d1dbe91_17" {
  content  = "pGzE0HbEP45Shc-qfb6KB1Vp5o9B62CKOd-swMB0cVQ"
  name     = "_acme-challenge.id.poporon.org"
  proxied  = false
  tags     = []
  ttl      = 120
  type     = "TXT"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

resource "cloudflare_dns_record" "terraform_managed_resource_91369f06f96dbb40a603129aa23bfb76_18" {
  content  = "\"v=DMARC1; p=none; rua=mailto:78a84b2960ba4f1ba848a494f6462e87@dmarc-reports.cloudflare.net\""
  name     = "_dmarc.poporon.org"
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "TXT"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

resource "cloudflare_dns_record" "terraform_managed_resource_05908300476f02b8a3ae5409db11b3c6_19" {
  comment  = "for GitHub Verify domain settings"
  content  = "\"173c4ac5a3\""
  name     = "_gh-poporonnet-o.poporon.org"
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "TXT"
  zone_id  = "878133051abf4697f6c4151e0b8b425a"
  settings = {}
}

