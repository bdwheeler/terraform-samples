

output "new_secret_arn" {
  value = "${aws_secretsmanager_secret.new_secret_object.arn}"
}
