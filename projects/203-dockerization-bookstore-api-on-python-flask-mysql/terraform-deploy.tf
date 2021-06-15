//This Terraform Template creates a Docker machine on EC2 Instance and
//deploys Bookstore Web API, Docker Machine will run on Amazon Linux 2
//EC2 Instance with custom security group allowing HTTP (Port 80)
//and SSH (Port 22) connections from anywhere.

provider "aws" {
  region = "us-east-1"
  //  access_key = ""
  //  secret_key = ""
  //  If you have entered your credentials in AWS CLI before, you do not need to use these arguments.
}

resource "aws_instance" "tf-docker-ec2" {
  ami             = "ami-09d95fab7fff3776c"
  instance_type   = "t2.micro"
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  key_name        = "mehmet"
=======
  key_name        = "northvirginia"
>>>>>>> 5a1c9f02536c3014ed2890184331e4ede12e11fb
=======
  key_name        = "mehmet"
>>>>>>> 52c97c4e33de0c84d6322f78c932ceafcd7b54a5
=======
  key_name        = "mehmet"
>>>>>>> 52c97c4e33de0c84d6322f78c932ceafcd7b54a5
=======
  key_name        = "northvirginia"
>>>>>>> e4d47162a527adb7bbb6d4e17844506122c3a21d
  //  Write your pem file name
  security_groups = ["docker-sec-gr-202"]
  tags = {
    Name = "Bookstore-Web-Server"
  }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  user_data = file("build-deploy.sh")
=======
=======
>>>>>>> e4d47162a527adb7bbb6d4e17844506122c3a21d
  user_data = <<-EOF
          #! /bin/bash
          yum update -y
          amazon-linux-extras install docker -y
          systemctl start docker
          systemctl enable docker
          usermod -a -G docker ec2-user
          curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
          -o /usr/local/bin/docker-compose
          chmod +x /usr/local/bin/docker-compose
          mkdir -p /home/ec2-user/bookstore-api
          TOKEN="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          FOLDER="https://$TOKEN@raw.githubusercontent.com/clarusway/cw-workshop/dev/devops/projects/202-dockerization-bookstore-api-on-python-flask-mysql/"
          curl -s --create-dirs -o "/home/ec2-user/bookstore-api/app.py" -L "$FOLDER"bookstore-api.py
          curl -s --create-dirs -o "/home/ec2-user/bookstore-api/requirements.txt" -L "$FOLDER"requirements.txt
          curl -s --create-dirs -o "/home/ec2-user/bookstore-api/Dockerfile" -L "$FOLDER"Dockerfile
          curl -s --create-dirs -o "/home/ec2-user/bookstore-api/docker-compose.yml" -L "$FOLDER"docker-compose.yml
          cd /home/ec2-user/bookstore-api
          docker build -t callahanclarus/bookstore-api:latest .
          docker-compose up -d
          EOF
<<<<<<< HEAD
>>>>>>> 5a1c9f02536c3014ed2890184331e4ede12e11fb
=======
  user_data = file("build-deploy.sh")
>>>>>>> 52c97c4e33de0c84d6322f78c932ceafcd7b54a5
=======
  user_data = file("build-deploy.sh")
>>>>>>> 52c97c4e33de0c84d6322f78c932ceafcd7b54a5
=======
>>>>>>> e4d47162a527adb7bbb6d4e17844506122c3a21d
}

resource "aws_security_group" "tf-docker-sec-gr-202" {
  name = "docker-sec-gr-202"
  tags = {
    Name = "docker-sec-group-202"
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}