output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}

output "load_balancer_dns_name" {
  value = module.load_balancer.lb_dns_name
}

output "route53_cname_fqdn" {
  value       = module.route53_cname.cname_fqdn
  description = "The FQDN of the CNAME record created in Route53"
}

output "route53_cname_record_id" {
  value       = module.route53_cname.cname_record_id
  description = "The ID of the CNAME record in Route53"
}












