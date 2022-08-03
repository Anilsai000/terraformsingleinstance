resource "aws_instance" "public_instances" {
    #ami = "${data.aws_ami.my_ami.id}"
    count = "${var.environment == "prod" ? 3 : 1}"
    ami = "${lookup(var.amis, var.aws_region, "us-east-1")}"
    #availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "LaptopKey"
    subnet_id = "${element(aws_subnet.public-subnet.*.id, count.index)}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true
    user_data = <<-EOF
                #!bin/bash
                sudo apt-get update
                sudo apt-get install -y nginx unzip
                echo "<h1>Deployed via Terraform </h1> | sudo tee /var/www/html/index.html
    EOF
    tags = {
        name = "publicServer-${count.index+1}"
        # env = "prod"
        #owner = "anil"
        #costcenter = "abcd"
    }             

}


# resource "aws_instance" "private_instances" {
#     #ami = "${data.aws_ami.my_ami.id}"
#     count = 1
#     ami = "ami-052efd3df9dad4825"
#     #availability_zone = "us-east-1a"
#     instance_type = "t2.micro"
#     key_name = "LaptopKey"
#     subnet_id = "${element(aws_subnet.private-subnets.*.id, count.index)}"
#     vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
#     associate_private_ip_address = true
#     user_data = <<-EOF
#                 #!bin/bash
#                 sudo apt-get update
#                 sudo apt-get install -y nginx unzip
#                 echo "<h1>Deployed via Terraform </h1> | sudo tee /var/www/html/index.html
#     EOF
#     tags = {
#         name = "PrivateServer-${count.index+1}"
#         # env = "prod"
#         #owner = "anil"
#         #costcenter = "abcd"
#     }             

# }