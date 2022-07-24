resource "aws_security_group" "sai_rds_sg" {
  name   = var.sai_rds_sg_nm
  vpc_id = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["VPC_ID"]

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "name" = "sai-DE"
  }

}

resource "aws_db_instance" "sai-rds-learn-de" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13.4"
  instance_class         = "db.t3.micro"
  name                   = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["RDS_DB_NAME"]
  username               = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["RDS_USER_NAME"]
  password               = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["RDS_PASSWORD"]
  skip_final_snapshot    = true
  storage_type           = "gp2"
  identifier             = "sairds"
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.sai_rds_sg.id]
  tags = {
    "Name" = "sai-DE"
  }

}