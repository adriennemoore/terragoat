provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "9e87bf6c3380dddfaf31b2360fe78e0deb25bf78"
    git_file             = "terraform/aws/newec2.tf"
    git_last_modified_at = "2021-11-08 18:54:42"
    git_last_modified_by = "73203597+adriennemoore@users.noreply.github.com"
    git_modifiers        = "73203597+adriennemoore"
    git_org              = "adriennemoore"
    git_repo             = "terragoat"
    yor_trace            = "1f98c21b-05a0-45c8-80e9-5f1c5d5b3542"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "9e87bf6c3380dddfaf31b2360fe78e0deb25bf78"
    git_file             = "terraform/aws/newec2.tf"
    git_last_modified_at = "2021-11-08 18:54:42"
    git_last_modified_by = "73203597+adriennemoore@users.noreply.github.com"
    git_modifiers        = "73203597+adriennemoore"
    git_org              = "adriennemoore"
    git_repo             = "terragoat"
    yor_trace            = "e98ceae4-b708-4d62-9156-0d5041d7dfb1"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
