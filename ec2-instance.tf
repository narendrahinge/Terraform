resource "aws_instance" "testvm" {
    ami      = lookup(var.AMIS, var.AWS_REGION, "")
    instance_type = "t2.micro"
    key_name      = var.MyKey
    vpc_security_group_ids = ["Security_grp_id"]
    subnet_id  = lookup(var.subnets, var.subnet, "")

tags = {
    Terraform = "true"
    Environment = "dev"
    Name   = "testvm"
}

provisioner "file" {
    source    = "script.sh"
    destination = "/tmp/script.sh"
}

provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/script.sh",
        "/tmp/script.sh"
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