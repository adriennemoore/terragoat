provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "docking_bay" {
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "a74fe5b0108c1e381f338785915e7750579e342c"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-02-18 16:54:55"
    git_last_modified_by = "73203597+adriennemoore@users.noreply.github.com"
    git_modifiers        = "73203597+adriennemoore"
    git_org              = "adriennemoore"
    git_repo             = "terragoat"
    yor_trace            = "9fbd6cee-7470-436e-b692-e2e4384b165a"
  }
}
