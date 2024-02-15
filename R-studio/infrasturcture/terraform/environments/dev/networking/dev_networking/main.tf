provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# terraform {
#   backend "s3" {
#     profile = "default"
#     bucket  = "terraform-state-file-dev-123"
#     key     = "dev/terraform.tfstate"
#     region  = "us-east-1"
#     encrypt = true
#   }
# }



module "vpc" {
  source             = "../../../../modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnet     = var.private_subnet
  availability_zones = var.availability_zones
  tags               = local.common_tags
}

module "ec2_key_pair" {
  source      = "../../../../modules/key_pair"
  key_name    = var.key_name
  secret_name = var.secret_name
  tags        = local.common_tags
}


module "security_group" {
  source     = "../../../../modules/security_group"
  vpc_id     = module.vpc.vpc_id
  tags       = local.common_tags
  depends_on = [module.vpc]
}

module "ec2_instance" {
  source                 = "../../../../modules/ec2_instance"
  ami_id                 = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.security_group.security_group_id]
  key_name               = module.ec2_key_pair.key_name
  common_tags            = local.common_tags
  depends_on             = [module.security_group]
  subnet_id              = module.vpc.subnet1_id
}

module "load_balancer" {
  source             = "../../../../modules/load_balancer"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = [module.vpc.subnet1_id, module.vpc.subnet2_id]
  target_instance_id = module.ec2_instance.instance_id
  security_group_id  = [module.security_group.security_group_id]
  tags               = local.common_tags
  depends_on         = [module.ec2_instance]
}

module "route53_cname" {
  source                 = "../../../../modules/route53"
  domain_name            = var.domain_name
  subdomain              = var.subdomain_name
  load_balancer_dns_name = module.load_balancer.lb_dns_name
}

