output "public_subnets" {
  value = "${aws_subnet.public_subnet.*.id}"
}

output "VPC_KANNAN" {
  value = "${aws_vpc.main.id}"
}