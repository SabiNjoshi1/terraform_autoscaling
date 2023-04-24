variable "vpc-cidr" {
  default       = "10.0.0.0/16"
  description   = "VPC CIDR Block"
  type          = string
}

variable "public-subnet-1-cidr" {
  default       = "10.0.1.0/24"
  description   = "Public Subnet 1 CIDR Block"
  type          = string
}

variable "public-subnet-2-cidr" {
  default       = "10.0.2.0/24"
  description   = "Public Subnet 2 CIDR Block"
  type          = string
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

variable "private-subnet-1-cidr" {
  default       = "10.0.11.0/24"
  description   = "Private Subnet 1 CIDR Block"
  type          = string
}

variable "private-subnet-2-cidr" {
  default       = "10.0.12.0/24"
  description   = "Private Subnet 2 CIDR Block"
  type          = string
}

variable "private-subnet-3-cidr" {
  default       = "10.0.21.0/24"
  description   = "Private Subnet 3 CIDR Block"
  type          = string
}

variable "private-subnet-4-cidr" {
  default       = "10.0.22.0/24"
  description   = "Private Subnet 4 CIDR Block"
  type          = string
}