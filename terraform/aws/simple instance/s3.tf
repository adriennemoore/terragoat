provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "docking_bay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "8af8446b3bad6624d6094ae30afdcab1ede00d13"
    git_file             = "terraform/aws/simple instance/s3.tf"
    git_last_modified_at = "2022-03-10 20:44:31"
    git_last_modified_by = "73203597+adriennemoore@users.noreply.github.com"
    git_modifiers        = "73203597+adriennemoore"
    git_org              = "adriennemoore"
    git_repo             = "terragoat"
    yor_trace            = "9ecf246f-17c7-4d2f-9d1c-2f031529567f"
  }
}
