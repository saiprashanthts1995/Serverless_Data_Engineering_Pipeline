resource "aws_dynamodb_table" "sai-dynamodb-table" {
  name         = "sai-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key    = "ProjectId"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "ProjectId"
    type = "S"
  }

  tags = {
    Name        = "sai-dynamodb-table"
    Environment = "development"
  }
}