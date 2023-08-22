resource "aws_eks_cluster" "my-eks" {
    name = "my-eks"
    role_arn = "aws IAM role"

vpc_config {
  endpoint_private_access = true
  endpoint_public_access = true
  subnet_ids = [ var.subnet_id_1, var.subnet_id_2, var.subnet_id_3, var.subnet_id_4 ]
  }
 dependepends_on = [
   aws_iam_role 
 ]
}
