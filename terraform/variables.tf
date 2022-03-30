variable "ami_id" {
  description = "ec2 machine AMI"
  default     = "ami-04505e74c0741db8d"
  type        = string
}

variable "vpc_id" {
  description = "Name of the vpc for my project"
  type        = string
  default     = "vpc-XXXXXX"
}

variable "type" {
  description = "Type of my ec2 instance"
  type        = string
  default     = "c6g.2xlarge"
}

variable "public_subnet_id" {
  type    = string
  default = "subnet-XXXXXX"
}

variable "my_keypair" {
  default = "aws_keypair"
}

variable "key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "root_volume_type" {
  default = "gp3"
}

variable "root_volume_size" {
  default = "20"
}

variable "external_volume_type" {
  default = "gp3"
}

variable "external_volume_size" {
  default = "100"
}