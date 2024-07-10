output "network" {
  description = "Examople Outputs from Network workspace"
  value       = local.outputs["network"]
}

output "aks_cluster" {
  description = "Mock of aks cluster values"

  value = null_resource.aks_cluster
}
