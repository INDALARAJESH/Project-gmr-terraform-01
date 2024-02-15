locals {
  common_tags = var.common_tags
}

data "template_file" "terraform_user_data_hardening" {
  template = file("${path.module}/templates/user_data.sh")
}

resource "aws_instance" "ubuntu" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  user_data              = base64encode(data.template_file.terraform_user_data_hardening.rendered)
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  subnet_id = var.subnet_id

  tags = merge(
    var.common_tags,
    {
      "Name" = "Project-GMR"
    }
  )
}