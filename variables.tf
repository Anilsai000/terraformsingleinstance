variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "amis" {
    description = "AMIs by region"
    default = {
        us-east-1 = "ami-0cff7528ff583bf9a" # Amazon Linux 2 Kernal 5.10
		    us-east-2 = "ami-02d1e544b84bf7502" # Amazon Linux 2 Kernal 5.10
		    # us-west-1 = "ami-824c4ee2" # ubuntu 14.04 LTS
		    # us-west-2 = "ami-f2d3638a" # ubuntu 14.04 LTS
    }
}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet_cidr" {}
# variable "public_subnet2_cidr" {}
# variable "public_subnet3_cidr" {}
# variable "private_subnet_cidr" {}
variable "public_subnet_name" {}
# variable "public_subnet2_name" {}
# variable "public_subnet3_name" {}
# variable "private_subnet_name" {}
variable Main_Routing_Table {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  # type = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "environment" { }
variable "instance_type" {
  # type = "map"
  default = {
    dev = "t2.nano"
    test = "t2.micro"
    prod = "t2.medium"
    }
}

