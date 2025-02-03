variable "instance_name" {
    type = list 
    default = ["mysql","frontend","backend"]
}

variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
  
}

variable "zone_id" {
    type = string
    default = "Z01062703DE28JISEJURW"
  
}

variable "domain_id" {
    type = string
    default = "myfooddy.fun"
  
}