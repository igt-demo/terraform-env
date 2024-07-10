/*
inspired by
https://github.com/Azure/terraform-azurerm-aks/tree/9.1.0/examples/application_gateway_ingress
*/

data "terraform_remote_state" "this" {
  for_each = toset(["network"])

  backend = "remote"

  config = {
    hostname     = "lifeci.scalr.io"
    organization = var.environment
    workspaces = {

      name = each.value
    }
  }
}

locals {
  outputs = { for k, v in data.terraform_remote_state.this : k => v.outputs }
}

module "aks_cluster" {
  source  = "Azure/aks/azurerm//examples/named_cluster"
  version = "9.1.0"

  resource_group_name = "${var.environment}-demo"
  # vnet_id = local.outputs["network"]["virtual_network_id"]
  # vnet_subnet_id = local.outputs["network"]["subnet_id"]
}
