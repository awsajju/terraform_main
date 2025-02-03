variable "instance_type" {
    type = string
    default = "t3.small"
  
}

variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
  
}

variable "ec2_tags" {
    type = map
    default = {
        name = "vars"
        project = "Expense"
        Environment = "dev"
    }
  
}

variable "security_desc" {
    type = string
    default = "alloow inbound and outbiund traffic"
  
}
