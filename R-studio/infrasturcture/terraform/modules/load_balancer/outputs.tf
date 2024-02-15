output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.my_lb.dns_name
}

output "lb_arn" {
  description = "The ARN of the load balancer"
  value       = aws_lb.my_lb.arn
}

output "http_listener_arn" {
  description = "The ARN of the HTTP listener"
  value       = aws_lb_listener.http.arn
}
