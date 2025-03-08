resource "aws_s3_bucket" "bronze_data" {
  bucket = "bronze-data-bucket242"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "archive"
    enabled = true
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  tags = {
    Name        = "Data Lake Bronze Bucket"
    Environment = "Dev"
  }
}
