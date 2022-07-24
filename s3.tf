resource "aws_s3_bucket" "sai_learn_DE" {
  bucket = "sai-learn-de-aws"

  tags = {
    Name        = "Environment"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "sai_bucket_acl" {
  bucket = aws_s3_bucket.sai_learn_DE.id
  acl    = "private"
}