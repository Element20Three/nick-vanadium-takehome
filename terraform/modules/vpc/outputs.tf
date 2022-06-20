
output "region" {
  description = "AWS region"
  value       = var.region
}

output "vpc_id" {
    value = module.vpc.vpc_id
}

output "private_subnets" {
    value = module.vpc.private_subnets
}