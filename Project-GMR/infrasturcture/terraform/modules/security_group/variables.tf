variable "vpc_id" {}
variable "ssh_access_cidr" {
  description = "CIDR block for SSH access"
  default     = "0.0.0.0/0"
}

variable "tags" {
  type = map(string)
}
