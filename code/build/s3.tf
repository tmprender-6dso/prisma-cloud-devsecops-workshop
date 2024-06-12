provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"
  acl           = "public-read-write"


  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "bb89d98b-7e2b-4034-a111-ebccc52dbcb9"
    git_commit           = "a4874de08b9716c62763e2d285bd2491ed462917"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-06-12 16:42:41"
    git_last_modified_by = "tmprender+june.workshop@gmail.com"
    git_modifiers        = "tmprender+june.workshop"
    git_org              = "tmprender-6dso"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
