variable "bucket_name" {
  description = "Name of the S3 bucket to store the website"
  type        = string
}

variable "index_file_path" {
  description = "Path to the index.html file to be uploaded to S3"
  type        = string
}

variable "ip_address" {
  description = "IP Address allowed to access the S3 bucket"
  type        = string
}

