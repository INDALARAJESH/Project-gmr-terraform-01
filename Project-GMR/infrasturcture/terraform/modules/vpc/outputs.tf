output "vpc_id" {
  value = aws_vpc.main.id
}

#output "public_subnet_ids" {
#  value = aws_subnet.public.*.id
#}

output "subnet_ids" {
  value = aws_subnet.public.*.id  
}

output "subnet1_id" {
  value = aws_subnet.public[0].id
}

output "subnet2_id" {
  value = aws_subnet.public[1].id
}


output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.gw.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}
