output "cname_fqdn" {
  value       = "${var.subdomain}.${var.domain_name}"
  description = "The FQDN of the CNAME record"
}

output "cname_record_id" {
  value       = aws_route53_record.cname_record.id
  description = "The ID of the CNAME record in AWS Route53"
}
