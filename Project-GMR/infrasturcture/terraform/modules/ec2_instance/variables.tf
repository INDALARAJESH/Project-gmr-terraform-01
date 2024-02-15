variable "ami_id" {}
variable "instance_type" {}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "common_tags" {
  type        = map(string)
  description = "Common tags to be assigned to each resource (that supports tagging) created by this module"
}
variable "key_name" {}

variable "subnet_id" {
  
}
