# Route53

# Private R53 zone
resource "aws_route53_zone" "local" {
  name = "pp-demo"
  vpc {
    vpc_id = module.vpc.vpc_id
  }
}

# RDS record
resource "aws_route53_record" "rds" {
  zone_id = aws_route53_zone.local.zone_id
  name    = "rds"
  type    = "CNAME"
  ttl     = "300"
  records = ["${module.rds.db_instance_address}"]
  depends_on = [
    module.rds.db_instance_address
  ]
}