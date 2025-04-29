variable "region" {
  description = "AWS Region to deploy in"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-sample"
}

variable "cluster_version" {
  description = "EKS cluster version."
  type        = string
  default     = "1.32"
}

variable "node_group_instance_type" {
  description = "Node Group Instance Type"
  type        = string
  default     = "m5.large"
}

variable "node_group_ami_type" {
  description = "Node Group AMI Type"
  type        = string
  default     = "AL2_x86_64"
}

variable "node_group_min_size" {
  description = "Node Group Minimum Size"
  type        = number
  default     = 1
}

variable "node_group_desired_size" {
  description = "Node Group Desired Size"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Node Group Maximum Size"
  type        = number
  default     = 2
}

variable "ami_release_version" {
  description = "Default EKS AMI release version for node groups"
  type        = string
  default     = "1.32.1-20250419"
}

variable "vpc_cidr" {
  description = "Defines the CIDR block used on Amazon VPC created for Amazon EKS."
  type        = string
  default     = "10.42.0.0/16"
}

variable "postgresql_container_name" {
  description = "PostgreSQL Container Name"
  type        = string
  default     = "postgresql"
}

variable "postgresql_user" {
  description = "Defines the PostgreSQL user"
  type        = string
  default     = "architected-main"
}

variable "postgresql_password" {
  description = "Defines the PostgreSQL password"
  type        = string
  default     = "architected-main"
}

variable "postgresql_database" {
  description = "Defines the PostgreSQL database"
  type        = string
  default     = "architected-main"
}

variable "nginx_container_name" {
  description = "Nginx Container Name"
  type        = string
  default     = "nginx"
}

variable "nginx_container_port" {
  description = "Nginx Container Port"
  type        = number
  default     = 8080
}

variable "application_container_name" {
  description = "Application Container Name"
  type        = string
  default     = "application"
}

variable "application_container_port" {
  description = "Application Container Port"
  type        = number
  default     = 8000
}

variable "application_container_image" {
  description = "Application Container Image"
  type        = string
  default     = "public.ecr.aws/d6l2j0j4/architected/eks-sample:latest"
}