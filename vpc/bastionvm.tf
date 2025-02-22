resource "aws_network_interface" "radical_interface" {
  subnet_id   = "${aws_subnet.public_subnet_1.id}"
  security_groups = ["${aws_security_group.radical-sg.id}"]
  private_ips = ["10.0.1.111"]

  tags = {
    Name = "radical_bastion_network_interface"
  }
}

resource "aws_instance" "radical-bastion" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
  key_name      = var.mykey
  

  network_interface {
    network_interface_id = aws_network_interface.radical_interface.id
    device_index         = 0
  }
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name   = "radical-bastion"
}

provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }

  # Login to the ec2-user with the aws key.
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    private_key = "${file("${var.keyPath}")}"
    host        = self.public_ip
  }

}
