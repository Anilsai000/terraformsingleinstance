resource "null_resource" "cluster" {
    count = "${var.environment == "prod" ? 3: 1}"
    provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh/"
        connection {
            type = "ssh"
            user = "ec2-user"
            #password = "#@Sep@2021"
            private_key = "${file("LaptopKey.pem")}"
            host = "${element(aws_instance.public_instances.*.public_ip, count.index)}"
        }
    }

    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/script.sh/",
        "sudo bash ./tmp/script.sh/",
        # "sudo yum update -y",
        # "sudo yum install nginx -y",
        # "service nginx start" 
      ]
      connection {
            type = "ssh"
            user = "ec2-user"
            #password = "#@Sep@2021"
            private_key = "${file("LaptopKey.pem")}"
            host = "${element(aws_instance.public_instances.*.public_ip, count.index)}"
        }
    }

       provisioner "local-exec" {
        command = <<EOH
        echo"${element(aws_instance.public_instances.*.public_ip, count.index)}" >> details && echo "${element(aws_instance.public_instances.*.private_ip, count.index)}" >> details,
        EOH
    }
}    



# echo"${element(aws_instance.public_instances.*.public_ip, count.index)}" | tr -d "/" | tr -d '"' >> details && echo "${element(aws_instance.public_instances.*.private_ip, count.index)}" | tr -d "/" | tr -d '"' >> details
# this above commands works in the LINUX becoz,the 'tr' is the linux command thats why this doesnt work in the windows cmd.....