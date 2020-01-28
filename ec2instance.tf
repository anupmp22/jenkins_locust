provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "devops_locust" {
   ami = "ami-0d542ef84ec55d71c"
   instance_type = "t2.micro"
   key_name = "locust" 
    tags = {
    Name = "firsttag"
  }
    security_groups = [ "${aws_security_group.SG_locust.name}"]
}

resource "aws_security_group" "SG_locust" {
name= "SG_locust"
 ingress {

from_port  =22
    to_port     =22
    protocol    = "tcp"
    cidr_blocks = ["59.162.161.225/32"]
}

ingress {
from_port = 8089
to_port =8089
protocol ="tcp"
cidr_blocks =["0.0.0.0/0"]
}
    
ingress {
from_port=8088
to_port =8088
protocol= "tcp"
cidr_blocks=["0.0.0.0/0"]
}

ingress {
from_port=8087
to_port =8087
protocol= "tcp"
cidr_blocks=["0.0.0.0/0"]
}
    
}
