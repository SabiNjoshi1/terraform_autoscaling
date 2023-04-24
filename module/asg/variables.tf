variable "key-name" {
  default       = "sabindemo"
  description   = "Pem File"
  type          = string
}
variable "image-id" {
    default = "ami-0a695f0d95cefc163"
}
variable "instance-type" {
  type = string
  default = "t2.micro"
  description = "Type of instance to deploy" 
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 4
}

variable "min_size" {
  default = 2
}

variable "security_groups"{}
variable "subnet_id" {}
variable "lb_subnets" {}