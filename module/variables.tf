variable "ami_id"{
    description = "AMI ID"
    type = string

}

variable "instance_type"{
    description = "instance type"
    type= string

}

variable "key_name"{
    description = "keyname"
    type = string

}

variable "subnet_id"{
    description = "subnetid"
    type = string

}

variable "security_group_ids"{
    description = "security group"
    type = list(string)

}

variable "instance_name"{
    description = "instance name"
    type = string
}
