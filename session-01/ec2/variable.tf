variable "sg-name"{
    type = string
    default = "roboshop-all-aws"
}

variable "sg-discription"{
    type = string
    default = "Allow all TLS inbound traffic"
}

variable "inbound-from-port"{
    #type = number
    default = "Allow all TLS inbound traffic"
}

variable "cidr_blocks"{
    type = list
    default = ["0.0.0.0/0"]
}

