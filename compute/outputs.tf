output "ec2_db-id" {
    value = aws_instance.db.id
}

output "ec2_web-id" {
    value = aws_instance.web.id
}

output "ec2-id" {
    value = aws_instance.ec2.id
}

output "ec2_02-id" {
    value = aws_instance.ec2_02.id
}

output "ec2_web02-id" {
    value = aws_instance.web_02[*].id
}