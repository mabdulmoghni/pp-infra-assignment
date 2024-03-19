## Database

resource "aws_db_subnet_group" "db_sub_gr" {
  description = "terrafom db subnet group"
  name        = "db_subnet_group"
  subnet_ids  = var.subnets
}

# MySQL
resource "aws_db_instance" "pp-demo-mysql" {

  db_name        = "ppdemodb"
  identifier     = "ppdemodb"
  engine         = "mysql"
  instance_class = "db.t3.micro"

  username = var.dbUser
  password = var.dbPass

  allocated_storage     = 10
  max_allocated_storage = 30
  storage_encrypted     = true
  multi_az              = false

  backup_retention_period             = 1
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = true
  #enabled_cloudwatch_logs_exports     = ["mysql", "upgrade"]

  db_subnet_group_name   = "${aws_db_subnet_group.db_sub_gr.id}"
  vpc_security_group_ids = [aws_security_group.pp-demo-rds-nsg.id]

}

## Security groups
# DB
resource "aws_security_group" "pp-demo-rds-nsg" {
  name        = "pp-demo-db"
  description = "SG for pp-demo DB"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inter-VCP for PSQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}