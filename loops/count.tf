resource "aws_instance" "web" {   
  count = 11  #count.index is a special variable given by terraform
  ami           = var.ami_id  
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "shipping" ||var.instance_names[count.index] == "mysql" ? "t3.micro" : "t2.micro"
  #vpc_security_group_ids = [aws_security_group.roboshop-all.id]

  tags = {
    Name = var.instance_names[count.index]
  }
}    



resource "aws_route53_record" "www" {
  count = 11  
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.devopv.online" #Here we are mixing the text with variable. This is called interpolation concept
  type    = "A"
  ttl     = 1
  records = [aws_instance.web[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}