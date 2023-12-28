variable "imagem" {
  description = "Fornecer o nome do ami"
  default     = "ami-0424a16d0e63b113b"
}

variable "tipo_instancia" {
  description = "Fornecer o tipo da instancia"
  default     = "t2.micro"
}


variable "aws_region" {
  description = "AWS Region."
  type        = string
  default     = "sa-east-1"
}


variable "aws_account_id" {
  description = "AWS Account ID."
  type        = string
}