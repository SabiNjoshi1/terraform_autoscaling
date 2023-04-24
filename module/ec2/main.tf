##########################################################################
#Create EC2 Instance
##########################################################################

resource "aws_instance" "webserver1" {
  ami                    = var.ami_id
  instance_type          = var.instance-type
  availability_zone      = var.availability-zone-1
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = var.public_subnet_id_1
  key_name               = var.key-name
  # user_data              = file("install_apache.sh")

  tags = {
    Name = "Web Server 1"
  }

}

##########################################################################
#Create Second EC2 Instance
##########################################################################

resource "aws_instance" "webserver2" {
  ami                    = var.ami_id
  instance_type          = var.instance-type
  availability_zone      = var.availability-zone-2
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = var.public_subnet_id_2
  key_name               = var.key-name
  # user_data              = file("install_apache.sh")

  tags = {
    Name = "Web Server 2"
  }

}


##########################################################################
# Create Web Security Group
##########################################################################

# resource "aws_security_group" "web-sg" {
#   name        = "Web-SG"
#   description = "Allow HTTP inbound traffic"
#   vpc_id      = var.vpc_id

#   ingress {
#     description = "HTTP from VPC"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "SSH from VPC"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "Web-SG"
#   }
# }

##########################################################################
# Create Application Security Group
##########################################################################

resource "aws_security_group" "webserver-sg" {
  name        = "Webserver-SG"
  description = "Allow inbound traffic from ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Webserver-SG"
  }
}

##########################################################################
# Create Database Security Group
##########################################################################

resource "aws_security_group" "database-sg" {
  name        = "Database-SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.webserver-sg.id]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database-SG"
  }
}

