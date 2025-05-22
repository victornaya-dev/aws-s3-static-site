
provider "aws" {
  region = var.region
}

# Placeholder for import
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  object_lock_enabled         = false
}



# aws_s3_bucket_policy.allow_access_from_another_account:
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
    bucket =  aws_s3_bucket.my_bucket.bucket
    policy = jsonencode(
        {
            Id        = "Policy1747859195264"
            Statement = [
                {
                    Action    = "s3:GetObject"
                    Effect    = "Allow"
                    Principal = "*"
                    Resource  = "arn:aws:s3:::deploy-static-website/*"
                    Sid       = "Stmt1747859193803"
                },
            ]
            Version   = "2012-10-17"
        }
    )
}


resource "aws_s3_bucket_public_access_block" "all_public_acess" {
    bucket                  = aws_s3_bucket.my_bucket.bucket
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}


resource "aws_s3_object" "image01" {
  key                    = "cumulus.jpg"
  bucket                 = aws_s3_bucket.my_bucket.bucket
  source                 = "${path.module}/website/cumulus.jpg"
  content_type                  = "image/jpeg"
  server_side_encryption        = "AES256"
  storage_class                 = "STANDARD"
}



resource "aws_s3_object" "index" {
  key                    = "index.html"
  bucket                 = aws_s3_bucket.my_bucket.bucket
  source                 = "${path.module}/website/index.html"
  content_type                  = "text/html"
  metadata                      = {}
  server_side_encryption        = "AES256"
  storage_class                 = "STANDARD"
  etag = filemd5("${path.module}/website/index.html")
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket                 = aws_s3_bucket.my_bucket.bucket
  index_document {
    suffix = "index.html"
  }
}


#% terraform import aws_s3_bucket_website_configuration.example deploy-static-website