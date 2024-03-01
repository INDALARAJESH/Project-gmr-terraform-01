

# variable "ami_id" {
#   description = "AMI ID for the EC2 instance"
#   default     = "ami-0c7217cdde317cfec"
# }

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}



#### VPC variables #####

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}


variable "private_subnet" {
  type    = string
  default = "10.0.2.0/24"
}


variable "key_name" {
  default = "Project-GMR"
}

variable "secret_name" {
  default = "Project-GMR-01"
}


variable "domain_name" {
  type    = string
  default = "cloudwithjagadeesh.xyz"
}

variable "subdomain_name" {
  default = "Raj"
}







