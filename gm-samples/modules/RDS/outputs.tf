


output "new_db_instance_name" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.new_db.name
}

output "new_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.new_db.arn
}


output "new_db_instance_endpoint" {
  description = "The Endpoint of the RDS instance"
  value       = aws_db_instance.new_db.address
}

output "new_db_instance_username" {
  description = "The username of the new RDS"
  value       = aws_db_instance.new_db.username
}


output "new_db_instance_password" {
  description = "The password for the user"
  value       = aws_db_instance.new_db.password
}


output "new_db_parameter_group_id" {
  description = "The db parameter group id"
  value       = aws_db_parameter_group.default.id
}

output "new_db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = aws_db_parameter_group.default.arn
}

output "new_db_option_group_id" {
  description = "The db option group id"
  value       = aws_db_option_group.default.id
}

output "new_db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = aws_db_option_group.default.arn
}
