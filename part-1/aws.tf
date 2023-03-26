provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_rds_cluster" "staging-cluster" {
  cluster_identifier      = "${var.app_name}-staging-cluster"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.09.2"
  availability_zones      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  database_name           = "${var.app_name}Test"
  master_username         = var.database_username
  master_password         = var.database_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.sg.id]
}

resource "aws_rds_cluster_instance" "staging-instance" {
  identifier          = "${var.app_name}test"
  cluster_identifier  = aws_rds_cluster.staging-cluster.id
  instance_class      = "db.t2.small"
  engine              = aws_rds_cluster.staging-cluster.engine
  engine_version      = aws_rds_cluster.staging-cluster.engine_version
  publicly_accessible = true
}

resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Web Security Group for RDS"
}

# Rules for inbound traffic
resource "aws_security_group_rule" "inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.sg.id

  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

# Rules for outbound traffic
resource "aws_security_group_rule" "outbound" {
  type              = "egress"
  security_group_id = aws_security_group.sg.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
