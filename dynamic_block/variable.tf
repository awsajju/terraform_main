variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "ingress" {
    default = [
        {
            description = "allow inbound rules"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "allow inbound rules"
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "allow inbound rules"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
  
}