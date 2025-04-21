output "public_ip"{
    description = "Public ip"
    value = aws_instance.this.public_ip
}

output "instance_id"{
    description = "instance id"
    value = aws_instance.this.id
}
