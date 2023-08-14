variable "AWS_ACCESS_KEY" {
    default =  "AWS_ACCESS_KEY"
}
variable "AWS_SECRET_KEY" {
  default = "AWS_SECRET_KEY"
}
variable "MyKey" {
        type = string
        default = "Keypair_name"
}
variable "KeyPath" {
   default = "aws.pem"
}
variable "subnet" {
    default = "Subnet you choose" 
}
variable "subnets" {
     type = map(string)
     default = {
       us-west-2a  = "SUBNET_ID"
        us-west-2b =  "SUBNET_ID"
        us-west-2c =  "SUBNET_ID"
        us-west-2d =  "SUBNET_ID"
    }
}

variable "AWS_RIGION" {
     default = "us-west-2"
}
variable "AMIS" {
    type = map(string)
    default = {
        us-east-1 = "ami-13be557e"
        us-west-2 = "ami-0ac64ad8517166fb1"
        us-west-1 = "ami-0d729a60"
        us-east-2 =  "ami-0fa49cc9dc8d62c84"
    }  
}