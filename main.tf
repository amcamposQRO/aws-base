# -------------------------
# Define el provider de AWS
# -------------------------
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "local"
}

variable "usuarios" {
  description = "Nombre de usuarios IAM"
  type        = set(string)
}

#resource "aws_iam_user" "ejemplo" {
#    count = length(var.usuarios)
#    name = "usuario-${var.usuarios[count.index]}"
#}

resource "aws_iam_user" "ejemplo" {
  for_each = var.usuarios
  name     = "user-${each.value}"
}