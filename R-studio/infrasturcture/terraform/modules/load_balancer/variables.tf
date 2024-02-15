variable "vpc_id" {
  description = "The VPC ID where the load balancer will be created"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to attach to the load balancer"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the load balancer"
}

variable "tags" {
  type = map(string)
}


variable "target_instance_id" {

}