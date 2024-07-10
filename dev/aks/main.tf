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
  outputs = {
    for k, v in data.terraform_remote_state.this : k => v.outputs
  }
}

resource "null_resource" "aks_cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {

    vnet_id = lookup(
      local.outputs["network"],
      "virtual_network_id",
      ""
    )

    vnet_subnet_id = lookup(
      local.outputs["network"],
      "subnet_id",
      ""
    )
  }
}