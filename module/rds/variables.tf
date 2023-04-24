variable "identifier" {
  default = "mysqldb"  
}

variable "storage_type" {
  default = "gp2"
}

variable "engine" {
  default = "mysql"
  description = "Use to supported values, and see the Engine parameter"
  type = string
}

variable "engine-version" {
  default = "8.0"
  description = "Engine version used is returned in the attribute "
  type = string
}

variable "instance-class" {
  default = "db.t2.micro"
  description = "Type of instance to deploy"
  type = string
}

variable "name" {
  default = "mydb"
  description = "Name of database"
  type = string
}

variable "username" {
  default = "username"
  description = "Database User name"
  type = string
}

variable "password" {
  default = "password"
  description = "Database Password"
  type = string
}

variable "vpc_id" {}
variable "private_subnet_id_3" {}
variable "private_subnet_id_4" {}
variable "security_groups_id" {}