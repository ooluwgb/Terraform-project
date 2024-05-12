module "s3_website" {
  source          = "./modules/s3_website"
  bucket_name     = var.bucket_name
  index_file_path = var.index_file_path
  ip_address      = var.ip_address
}

