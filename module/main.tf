provider "aws"{
    region = "us=west-2"
}

resource "aws_instance" "example"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = var.key_name
    vpc_security_group_ids = var.security_group_ids


    tags = {
        name = var.instance_name
    }
}
