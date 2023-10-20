resource "aws_ses_domain_identity" "ses_domain" {
  domain = var.domain_name
}

resource "aws_ses_domain_dkim" "example" {
  domain = aws_ses_domain_identity.ses_domain.domain
}

resource "aws_ses_domain_identity" "example" {
  domain = "example.com"
}

resource "aws_route53_record" "example_amazonses_verification_record" {
 # zone_id = "Z09325512BDYURM6QLNNY"
  zone_id =  aws_route53_zone.dev.zone_id
  name    = "_amazonses.example.com"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.example.verification_token]
}

resource "aws_ses_domain_mail_from" "example" {
  domain           = aws_ses_domain_identity.ses_domain.domain
  mail_from_domain = "bounce.${aws_ses_domain_identity.example.domain}"
}

resource "aws_ses_configuration_set" "example" {
  name = "my-configuration"
}

resource "aws_ses_event_destination" "example" {
  name = "example"
  configuration_set_name = aws_ses_configuration_set.example.name
  enabled                = true
  matching_types         = ["bounce", "send"]
  sns_destination {
    topic_arn = aws_sns_topic.my_sns.arn
  }
}

resource "aws_sns_topic" "my_sns" {
  name = "my-sns-topic"
}

resource "aws_route53_zone" "dev" {
  name = "myexample2.com"

  tags = {
    Environment = "dev"
  }
}

resource "aws_iam_policy" "ses_publish_policy" {
  name = "ses-publish-policy"
  description = "SES Publish Policy"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ses:SendRawEmail",
          "ses:SendEmail",
        ],
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role" "ses_role" {
  name = "ses-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ses.amazonaws.com",
        },
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "ses_attach" {
  policy_arn = aws_iam_policy.ses_publish_policy.arn
  role = aws_iam_role.ses_role.name
}

resource "aws_ses_identity_notification_topic" "example" {
  identity = aws_ses_domain_identity.ses_domain.domain
  notification_type = "Bounce"
  topic_arn = aws_sns_topic.my_sns.arn
  include_original_headers = true
}

