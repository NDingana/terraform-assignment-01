output "vpcid_from_networking_module_output" {
  value = aws_vpc.prod-vpc.id
}

output "subpub_id_from_networking_module_output" {
  value = aws_subnet.prod-subnet-public-1.id
}