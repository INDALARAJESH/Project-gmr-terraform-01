variable "domain_name" {
  description = "The domain name of the existing hosted zone"
  type        = string
}

variable "subdomain" {
  description = "The subdomain to create a CNAME record for"
  type        = string
}

variable "load_balancer_dns_name" {
  description = "The DNS name of the load balancer to point the CNAME record to"
  type        = string
}


