provider "aws"{
    region = "us=west-2"
}

resource "aws_instance" "example"{
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name


    tags = {
        name = var.instance_name
    }
}
