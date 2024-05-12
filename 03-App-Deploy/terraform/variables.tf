variable "aws_region" {
  description = "AWS Region for the infrastructure"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to be created for the website"
  type        = string
}

variable "index_file_path" {
  description = "Relative path to the index.html file to be uploaded to S3"
  type        = string
  default     = "index.html"
}

variable "ip_address" {
  description = "IP Address allowed to access the S3 bucket"
  default     = "3.121.56.176"
}

