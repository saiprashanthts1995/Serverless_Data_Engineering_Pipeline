data "aws_secretsmanager_secret" "by-arn" {
  name = "arn:aws:secretsmanager:ca-central-1:000549131923:secret:sai-de-pipeline-terraform-secret-GUCpdQ"
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.by-arn.id
}