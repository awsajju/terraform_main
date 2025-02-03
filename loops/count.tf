resource "aws_instance" "aws" {
    count = length(var.instance_name)
    ami = var.ami_id
    instance_type = var.instance_name == "mysql" ? "t3.micro" : "t3.large"
    tags = {
      name = var.instance_name[count.index]
    }
  
}

resource "aws_route53_record" "aws" {
count = length(var.instance_name)
 zone_id = var.zone_id
 name = "${var.instance_name[count.index]}.${var.domain_id}"
 type = "A"
 ttl = 1
 records = [var.instance_name[count.index] == "frontend" ? aws_instance.aws[count.index].public_ip : aws_instance.aws[count.index].private_ip]
  
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