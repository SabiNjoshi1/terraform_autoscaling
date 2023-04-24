##########################################################################
# Create RDS Instance
##########################################################################
resource "aws_db_instance" "default" {
  identifier             = var.identifier
  allocated_storage      = 10
  storage_type           = var.storage_type
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.engine
  engine_version         = var.engine-version
  instance_class         = var.instance-class 
  multi_az               = true
  name                   = var.name
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.security_groups_id]
}

resource "aws_db_subnet_group" "default" {
  # name       = "main"
  subnet_ids = [var.private_subnet_id_3, var.private_subnet_id_4]

  tags = {
    Name = "My DB subnet group"
  }
}

