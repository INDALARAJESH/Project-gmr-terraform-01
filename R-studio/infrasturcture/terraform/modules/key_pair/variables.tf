variable "key_name" {
  description = "The name of the AWS key pair"
  type        = string
}

variable "secret_name" {
  description = "The name of the secret in AWS Secrets Manager"
  type        = string
}
variable "tags" {
  type = map(string)
}