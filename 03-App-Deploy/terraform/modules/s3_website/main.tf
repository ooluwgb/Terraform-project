resource "aws_s3_bucket" "website" {
    bucket = "polarisiobuckgameappbored"
}

resource "aws_s3_bucket_public_access_block" "website_access_block" {
    bucket = aws_s3_bucket.website.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "website_policy" {
    bucket = aws_s3_bucket.website.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action    = "s3:*",
                Effect    = "Allow",
                Principal = "*",
                Resource  = [
                    "arn:aws:s3:::${aws_s3_bucket.website.bucket}",
                    "arn:aws:s3:::${aws_s3_bucket.website.bucket}/*"
                ],
                Condition = {
                    IpAddress = {
                        "aws:SourceIp" = var.ip_address
                    }
                }
            }
        ]
    })
}

resource "aws_s3_bucket_website_configuration" "website_conf" {
    bucket = aws_s3_bucket.website.id

    index_document {
        suffix = "index.html"
    }
    error_document {
        key = "error.html"
    }
}

resource "aws_s3_object" "web_content" {
    bucket          = aws_s3_bucket.website.id
    key             = "index.html"
    source          = "./index.html"
    content_type    = "text/html"
}

