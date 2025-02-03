resource "aws_instance" "aws" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.aws_security.id]
    tags = var.ec2_tags
  
}

resource "aws_security_group" "aws_security" {
    name = "aws_security"
    description = "allow_inbound and out biund rules"
    ingress {
        description = "allow_inbound"
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "allo outbounbd rules"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}