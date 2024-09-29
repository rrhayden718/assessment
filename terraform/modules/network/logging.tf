#S3 Bucket for Logs
data "aws_iam_policy_document" "s3" {
      statement {
    sid       = "Statement1"
    effect    = "Allow"
    resources = ["${aws_s3_bucket.bucket.arn}"]
    actions   = ["s3:*"]

    principals {
      type        = "Service"
      identifiers = ["workspaces.amazonaws.com"]
    }
  }
    statement {
    sid       = "AWSCloudTrailAclCheck"
    effect    = "Allow"
    resources = ["${aws_s3_bucket.bucket.arn}"]
    actions   = ["s3:GetBucketAcl"]

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }

  statement {
    sid       = "AWSCloudTrailWrite"
    effect    = "Allow"
    resources = ["${aws_s3_bucket.bucket.arn}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]
    actions   = ["s3:PutObject"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }
}


resource "aws_s3_bucket" "bucket" {
  bucket = "${format("s3-%s-%s-%s-%s", var.region, var.customer, var.project, var.environment)}"

   tags = {
    Name        = "${format("s3-%s-%s-%s-%s", var.region, var.customer, var.project, var.environment)}"
    Customer    = "${var.customer}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Owner       = "${var.owner}"
    Terraform   = true
  }
}

resource "aws_s3_bucket_policy" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.s3.json
  
}

resource "aws_s3_bucket_acl" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}

#cloudtrail 

data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "o365" {
  name                          = "tf-trail-assessment"
  s3_bucket_name                = aws_s3_bucket.bucket.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}

# # Log group
# resource "aws_cloudwatch_log_group" "cwl" {
#   name_prefix       = "${format("cwl-%s-%s-%s-%s", var.region, var.customer, var.project, var.environment)}"
#   retention_in_days = 7

#   tags {
#     Name        = "${format("cwl-%s-%s-%s-%s", var.region, var.customer, var.project, var.environment)}"
#     Customer    = "${var.customer}"
#     Environment = "${var.environment}"
#     Project     = "${var.project}"
#     Owner       = "${var.owner}"
#     Terraform   = true
#   }
# }

# data "aws_iam_policy_document" "flowlog_assume_role_policy" {
#   statement {
#     sid     = ""
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["vpc-flow-logs.amazonaws.com"]
#     }
#   }
# }

# resource "aws_iam_role" "flowlog_role" {
#   name               = "${format("role-%s-flowlog-%s-%s", var.customer, var.project, var.environment)}"
#   assume_role_policy = "${data.aws_iam_policy_document.flowlog_assume_role_policy.json}"
# }

# data "aws_iam_policy_document" "flowlog_policy" {
#   statement {
#     sid = ""

#     actions = [
#       "logs:CreateLogGroup",
#       "logs:CreateLogStream",
#       "logs:PutLogEvents",
#       "logs:DescribeLogGroups",
#       "logs:DescribeLogStreams",
#     ]

#     resources = ["*"]
#   }
# }

# resource "aws_iam_role_policy" "flowlog_policy" {
#   name   = "${format("policy-%s-flowlog-%s-%s", var.customer, var.project, var.environment)}"
#   role   = "${aws_iam_role.flowlog_role.id}"
#   policy = "${data.aws_iam_policy_document.flowlog_policy.json}"
# }

# # Enable FLow Logs
# resource "aws_flow_log" "vpc_flow_log" {
#   log_destination = "${aws_cloudwatch_log_group.cwl.arn}"
#   iam_role_arn    = "${aws_iam_role.flowlog_role.arn}"
#   vpc_id          = "${aws_vpc.main.id}"
#   traffic_type    = "ALL"
# }
