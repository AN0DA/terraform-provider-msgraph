provider "msgraph" {
  tenant_id        = "common"
  client_id        = "82492584-8587-4e7d-ad48-19546ce8238f"
  client_secret    = "" // empty for device code authorization
  token_cache_path = "token_cache.json"
}

variable "tenant_domain" {
  type    = string
  default = "l0wdev.onmicrosoft.com"
}

resource "msgraph_user" "demousers" {
  count               = 5
  user_principal_name = "demouser${count.index}@${var.tenant_domain}"
  display_name        = "Demo User ${count.index}"
  given_name          = "User ${count.index}"
  surname             = "Demo"
  mail_nickname       = "demouser${count.index}"
  other_mails         = ["demouser${count.index}@example.com"]
}
