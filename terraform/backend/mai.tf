## Provider to be initialized.

provider "vault" {
              address = "${var.vault_addr}"
              token = "${var.vault_token}"
}
data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "ec2-admin-role"
}
provider "aws" {
  access_key = "${data.vault_aws_access_credentials.creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.creds.secret_key}"
  region     = "${var.region}"
}
module "lamp-stack" {
              source = "D:\Terraform\Stage\modules"
              }
