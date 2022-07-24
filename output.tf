output "sai_rds_hostname" {
  value = aws_db_instance.sai-rds-learn-de.address
}

output "sai_aws_rds_username" {
  value     = aws_db_instance.sai-rds-learn-de.username
  sensitive = true
}

output "sai_rds_username_from_secrets" {
  value = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.current.secret_string))["RDS_USER_NAME"]
}

output "sai-queue-standard-name" {
  value = aws_sqs_queue.sai-queue-standard.url
}

output "sai-queue-fifo-name" {
  value = aws_sqs_queue.sai-queue-fifo.url
}