resource "aws_instance" "instance" {
   count         = var.instance_count
   ami           = data.aws_ami.ubuntu.id
   instance_type = "t3.micro"

   ebs_block_device {
      device_name = "/dev/sdg"
      volume_size = 5
      volume_type = "gp2"
   }

   tags = {
      Name = "${var.tagName}-${count.index + 1}"
   }
}