data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = ["amazon"]


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}


resource "aws_instance" "b" {
   ami                         = "${data.aws_ami.amazon-linux-2.id}"
   associate_public_ip_address = true
   key_name                    = "ProdKeyPair"
   instance_type               = "t2.micro"  

  tags = {
    Name        = "PRODSERVER05"
    Environment = "Prod"
  }
}


