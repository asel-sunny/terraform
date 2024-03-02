resource "aws_db_instance" "default" {
  allocated_storage         = 10
  identifier                = replace(local.name, "rtype", "rds") # name of RDS Instance - AWS Resource Name
  db_name                   = "mydb"                              # name of the database in your RDS Instance - MYSQL DB
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t3.micro"
  username                  = "admin"
  password                  = random_password.db_passwd.result
  parameter_group_name      = "default.mysql5.7"
  tags                      = local.common_tags
  skip_final_snapshot       = var.env != "prod" ? true : false
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}-final-snapshot"
}


resource "random_password" "db_passwd" {
  length           = 20
  special          = true
  override_special = "%"
}

