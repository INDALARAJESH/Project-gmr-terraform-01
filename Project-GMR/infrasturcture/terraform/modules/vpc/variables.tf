variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet" {
  description = "The CIDR block for the private subnet"
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
}

variable "tags" {
  type = map(string)
}
