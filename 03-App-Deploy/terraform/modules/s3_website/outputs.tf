output "s3_bucket_name" {
    value = aws_s3_bucket.website.bucket
}

output "website_url" {
    value = "http://${aws_s3_bucket.website.bucket_regional_domain_name}/"
}

