variable "ami" {
  type        = string
  default     = "ami-0c2b8ca1dad447f8a"
  description = "ami ID for Amazon Linux 2"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "default instance type for servers"
}

variable "iam_pol-name" {
  type        = string
  default     = "GlacierEFS-EC2"
  description = "name for our IAM Glacier Policy"
}

variable "iam_attachment" {
  type        = string
  default     = "attachment"
  description = "IAM Policy Attachment"
}

variable "db_instance-name" {
  type        = string
  default     = "myDB"
  description = "name for our DB instance"
}

variable "db_indentifier" {
  type        = string
  default     = "my-first-rds"
  description = "ID for RDS instance"
}

variable "db_class" {
  type        = string
  default     = "db.t2.micro"
  description = "DB instance class for our RDS"
}

variable "db_engine" {
  type        = string
  default     = "mariadb"
  description = "engine for our DB"
}

variable "db_engVersion" {
  type        = string
  default     = "10.2.21"
  description = "DB engine version"
}

variable "db_username" {
  type        = string
  default     = "mbua"
  description = "db username"
}

variable "db_password" {
  type        = string
  default     = "password123"
  description = "password for our DB"
}

variable "db_port" {
  type        = number
  default     = 3306
  description = "port number for DB"
}

variable "db_storage" {
  type        = number
  default     = 20
  description = "allocated storage amount for db"
}

variable "db_skip-snap" {
  type        = bool
  default     = true
  description = "skips final snapshot on deletion of db"
}

variable "allowHTTPS" {
  type        = string
  default     = "Allow HTTPS"
  description = "SG name for allowing HTTPS"
}

variable "HTTPS" {
  type        = number
  default     = 443
  description = "port number for HTTPS"
}

variable "protocol" {
  type        = string
  default     = "TCP"
  description = "protocol"
}

variable "sg_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Open to the internet"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr block for VPC"
}

variable "vpc_dns-support" {
  type        = string
  default     = "true"
  description = "gives us internal domain name"
}

variable "vpc_dns-hostnames" {
  type        = string
  default     = "true"
  description = "gives us internal host name"
}

variable "vpc_classiclink" {
  type        = string
  default     = "false"
  description = "no classic links"
}

variable "vpc_tenancy" {
  type        = string
  default     = "default"
  description = "instance tenancy is default"
}

variable "vpc_tags" {
  type = map(any)
  default = {
    Name = "dev-vpc"
    Team = "DevOps"
  }
  description = "tags for VPC"
}

variable "pubsub_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "cidr block for public sub1"
}

variable "sub_map-public" {
  type        = string
  default     = "true"
  description = "makes the subnet public"
}

variable "pubsub_tags" {
  type = map(any)
  default = {
    Name = "prod-subnet-public-1"
    Team = "DevOps"
  }
  description = "tags for public subnet 1"
}

variable "privsub_cidr" {
  type        = string
  default     = "10.0.2.0/24"
  description = "cidr block for private sub1"
}

variable "sub_map-public_no" {
  type        = string
  default     = "false"
  description = "makes the subnet private"
}

variable "privsub_tags" {
  type = map(any)
  default = {
    Name = "prod-subnet-private-1"
    Team = "DevOps"
  }
  description = "tags for private subnet 1"
}

variable "az" {
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b"]
  description = "availability zones for subnets"
}

variable "igw_tags" {
  type = map(any)
  default = {
    Name = "prod-igw"
  }
  description = "tags for IGW"
}

variable "pubRT_tags" {
  type = map(any)
  default = {
    Name = "prod-public-crt"
  }
  description = "tags for IGW"
}

variable "egress_port" {
  type        = number
  default     = 0
  description = "port number for egress"
}

variable "egress_protocol" {
  type        = number
  default     = -1
  description = "protocol for egress sg"
}

variable "SSH" {
  type        = number
  default     = 22
  description = "port number for SSH"
}

variable "myIP" {
  type        = string
  default     = "47.185.216.170/32"
  description = "my home IP address"
}

variable "HTTP" {
  type        = number
  default     = 80
  description = "port for http"
}

variable "mySG_tags" {
  type = map(any)
  default = {
    Name = "ssh-allowed"
  }
  description = "tags for for security group"
}

variable "ec2_count" {
  type        = number
  default     = 4
  description = "ec2 count index for web servers"
}
variable "webserver_tags" {
  type = map(any)
  default = {
    Name = "WEB_SERVER"
    Env  = "DEV"
    Team = "DevOps"
  }
  description = "tags for web servers"
}

variable "iam_username" {
  type        = string
  default     = "mbua-tf"
  description = "IAM username"
}