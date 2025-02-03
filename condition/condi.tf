resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type == "mysql" ? "t3.small" : "t3.large"

    tags = var.ec2_tags
  
}