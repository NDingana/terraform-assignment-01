provider "aws" {
  region = "us-east-1"
}

module "computemodule" {
  source = "./compute/"

# vpc_id_var_in_compute_module will be used in sg.tf
# the value of vpc_id_var_in_compute_module here will override that set inisde the module's variables.tf
  vpc_id_var_in_compute_module = module.networkingmodule.vpcid_from_networking_module_output

  # vpc_id_var_in_compute_module will be used in ec2.tf
# the value of pubsub_id_var_in_compute_module here will override that set inisde the module's variables.tf
  pubsub_id_var_in_compute_module = module.networkingmodule.subpub_id_from_networking_module_output
}

module "databasesmodule" {
  source = "./databases/"
}

module "networkingmodule" {
  source = "./networking/"
}

module "IAM" {
  source = "./IAM/"
}

output "vpcid" {
  value = module.networkingmodule.vpcid_from_networking_module_output
}

output "ec2_db-id" {
    value = module.computemodule.ec2_db-id
}

output "ec2_web-id" {
    value = module.computemodule.ec2_web-id
}

output "ec2-id" {
    value = module.computemodule.ec2-id
}

output "ec2_02-id" {
    value = module.computemodule.ec2_02-id
}

output "ec2_web02-id" {
    value = module.computemodule.ec2_web02-id
}

output "rds_id" {
    value = module.databasesmodule.rds_id
}

output "iam_user-ID" {
    value = module.IAM.iam_user-ID
}

output "iam_user-ARN" {
    value = module.IAM.iam_user-ARN
}