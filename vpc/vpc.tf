resource "aws_vpc" "put Vpc name" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true

tags = {
        Name = "Vpc name"
    }
}
