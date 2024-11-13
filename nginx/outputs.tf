output "public_ip" {
  value = aws_instance.nginx.public_ip
  description = "Public IP access to the NGINX instance."
}
