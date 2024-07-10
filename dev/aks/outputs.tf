output "network" {
  description = "Examople Outputs from Network workspace"
  value       = local.outputs["network"]
}

output "ingress_endpoint" {
  description = "ingress endpoint example"

  value = try("http://${data.kubernetes_ingress_v1.ing.status[0].load_balancer[0].ingress[0].ip}", "if it's not a http url, you need further investigation")

  depends_on = [time_sleep.wait_for_ingress]
}
