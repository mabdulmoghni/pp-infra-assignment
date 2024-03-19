output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = try("${aws_db_instance.pp-demo-mysql.address}", null)
}