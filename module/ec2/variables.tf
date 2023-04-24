variable "ami_id" {
  type = string
  default = "ami-0a695f0d95cefc163"
  description = "AMI ID to deploy EC2 instance"
}

variable "instance-type" {
  type = string
  default = "t2.micro"
  description = "Type of instance to deploy" 
}

variable "availability-zone-1" {
  default       = "us-east-2a"
  description   = "First Availability Zone"
  type          = string
}

variable "availability-zone-2" {
  default       = "us-east-2b"
  description   = "First Availability Zone"
  type          = string
}

variable "key-name" {
  default       = "sabindemo"
  description   = "Pem File"
  type          = string
}

variable "vpc_id" {}
variable "public_subnet_id_1" {}
variable "public_subnet_id_2" {}

