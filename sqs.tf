resource "aws_sqs_queue" "sai-queue-standard" {
  name                      = "sai-queue-standard"
  delay_seconds             = 0
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 0
  tags = {
    Environment = "development"
  }
}

resource "aws_sqs_queue" "sai-queue-fifo" {
  name                        = "sai-queue-fifo.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}