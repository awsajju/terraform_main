resource "aws_instance" "aws" {
    ami = var.ami_id
    instance_type = "t2_micro"
    tags = {
      name = "dynamic"
    }
  
}

resource "aws_security_group" "allow_all" {
    name = "allow_all"
    description = "allowing inbound and outbout rules"

    dynamic ingress {
        for_each = var.ingress
        content {
        description = ingress.value["description"]
        from_port = ingress.value["from_port"]
        to_port = ingress.value["to_port"]
        protocol = ingress.value["protocol"]
        cidr_blocks = ingress.value["cidr_blocks"]
        }
    }
    egress {
        description = "allow out bound rules"
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
  
}