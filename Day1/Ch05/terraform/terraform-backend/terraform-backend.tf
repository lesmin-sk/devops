resource "aws_s3_bucket" "skt-user05-s3-tf-state" {

  bucket = "skt-user05-s3-bucket-tfstate"

  tags = {
    "Name" = "skt-user05-s3-bucket-tfstate"
  }
  
}

resource "aws_dynamodb_table" "skt-user05-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.skt-user05-s3-tf-state]
  name         = "skt-user05-s3-ddb-tflock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "skt-user05-s3-ddb-tflock"
  }

}


