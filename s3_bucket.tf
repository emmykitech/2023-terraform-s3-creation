# declear provider = "aws"
provider "aws" {
  region = "us-east-1"

}

# create  an s3 bucket
resource "aws_s3_bucket" "ref_bucket" {
  bucket = "tf-test-bucket-kidochukwu"
}

#enable acl
resource "aws_s3_bucket_acl" "ref_bucket_acl" {
  bucket = aws_s3_bucket.ref_bucket.id
  acl    = "public-read"
}

# create an s3 bucket with versioning.
resource "aws_s3_bucket_versioning" "ref_versioning_example" {
  bucket = aws_s3_bucket.ref_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# upload a folder into bucket.
resource "aws_s3_object" "uploads_folder" {
  bucket = aws_s3_bucket.ref_bucket.id
  key    = "uploads/" # Specify the desired folder name as part of the key
  source = ""         # You can leave this empty as there's no local file to upload for a folder
}
