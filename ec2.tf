resource "aws_instance" "name" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    instance_type = "t2.micro"
     tags = {
      Name = "Hello terraform"
    }
  
}

resource "aws_security_group" "allow_all" {
    name = "allow_all"
    description = "allow all inbound and outbound"
    ingress {
        description = "allo inbound rules"
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "allowing outbound rules"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "Terraform_security"
    }
  
}