output "vpc_id"{
  value = aws_vpc.vpc.id
}

output "public_subnet_id_1"{
  value = aws_subnet.web-subnet-1.id
}

output "public_subnet_id_2"{
  value = aws_subnet.web-subnet-2.id
}

output "private_subnet_id_1"{
  value = aws_subnet.application-subnet-1.id
}

output "private_subnet_id_2"{
  value = aws_subnet.application-subnet-2.id
}

output "private_subnet_id_3"{
  value = aws_subnet.database-subnet-1.id
}

output "private_subnet_id_4"{
  value = aws_subnet.database-subnet-2.id
}