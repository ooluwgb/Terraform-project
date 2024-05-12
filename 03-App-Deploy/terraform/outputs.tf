output "s3_bucket_name" {
  value       = module.s3_website.s3_bucket_name
  description = "The name of the S3 bucket used for the website"
}

output "website_url" {
  value       = module.s3_website.website_url
  description = "The URL of the S3 hosted website"
}

