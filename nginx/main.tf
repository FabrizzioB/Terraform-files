provider "aws" {
  region = "eu-west-2"  # London Area
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP and HTTPS access"
  vpc_id     = "vpc-#################"

  # Regras de entrada para HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regras de entrada para HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regras de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outside traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx" {
  ami           = "ami-0031a24a5d5c1edb7" # Search for a valid AMI
  instance_type = "t2.micro"

  tags = {
    Name = "nginx web server"
  }
    
  # Instalar Docker e Nginx Web Server
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo service docker start
              sudo docker run -d -p 80:80 nginx
              EOF
    
  # Associar o grupo de segurança à instância
  vpc_security_group_ids = [aws_security_group.allow_http.id]  # Associate the VPC to the right Security Group
}
