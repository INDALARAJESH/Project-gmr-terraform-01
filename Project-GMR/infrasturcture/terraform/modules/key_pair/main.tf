resource "tls_private_key" "ec2_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "tf-key" {
  content  = tls_private_key.ec2_ssh.private_key_pem
  filename = "${var.key_name}.pem"
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_ssh.public_key_openssh
  tags = merge(
  var.tags)
}

#resource "aws_secretsmanager_secret" "key_pair_secret" {
# name = var.secret_name
#}

#resource "aws_secretsmanager_secret_version" "key_pair_secret_version" {
# secret_id     = aws_secretsmanager_secret.key_pair_secret.id
#  secret_string = tls_private_key.ec2_ssh.private_key_pem
#}
