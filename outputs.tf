output "ses_domain_identity" {
  value = aws_ses_domain_identity.ses_domain
}

output "ses_domain_dkim" {
  value = aws_ses_domain_dkim.example
}

output "ses_domain_mail_from" {
  value = aws_ses_domain_mail_from.example
}

output "ses_event_destination" {
  value = aws_ses_event_destination.example
}

output "ses_sns_topic" {
  value = aws_sns_topic.my_sns
}

output "ses_iam_role" {
  value = aws_iam_role.ses_role
}