resource "vault_azure_secret_backend" "azure" {
  subscription_id = var.subscription_ID
  tenant_id       = var.tenant_ID
  client_secret   = var.SP_Password
  client_id       = var.SP_AppID
  use_microsoft_graph_api = true
}

resource "vault_azure_secret_backend_role" "generated_role" {
  backend                     = vault_azure_secret_backend.azure.path
  role                        = "generated_role"
  ttl                         = 300
  max_ttl                     = 600

  azure_roles {
    role_name = "Owner"
    scope =  "/subscriptions/${var.subscription_ID}"
  }
}
