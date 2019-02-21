variable "key_name" {
  default = "first"
}

variable "key_location" {
  default = "~/keypairs/ec2/first.pem"
}

variable "destination_location" {
  default = "/home/ubuntu/key.pem"
}

variable "node-count" {
  default = 2
}

