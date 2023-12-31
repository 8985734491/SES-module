## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |
| <a name="requirement_awsutils"></a> [awsutils](#requirement\_awsutils) | >= 0.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.ses_publish_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ses_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ses_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_route53_record.example_amazonses_verification_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_ses_configuration_set.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_configuration_set) | resource |
| [aws_ses_domain_dkim.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_domain_identity.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_domain_identity.ses_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_domain_mail_from.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_mail_from) | resource |
| [aws_ses_event_destination.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_event_destination) | resource |
| [aws_ses_identity_notification_topic.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_identity_notification_topic) | resource |
| [aws_sns_topic.my_sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |


## Usage

```hcl
module "ses" {
  source = "path/to/ses-module"
  domain_name = "yourdomain.com"
  mail_from_domain = "yourdomain.com"
}

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for SES identity | `string` | n/a | yes |
| <a name="input_mail_from_domain"></a> [mail\_from\_domain](#input\_mail\_from\_domain) | The custom MAIL FROM domain | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ses_domain_dkim"></a> [ses\_domain\_dkim](#output\_ses\_domain\_dkim) | n/a |
| <a name="output_ses_domain_identity"></a> [ses\_domain\_identity](#output\_ses\_domain\_identity) | n/a |
| <a name="output_ses_domain_mail_from"></a> [ses\_domain\_mail\_from](#output\_ses\_domain\_mail\_from) | n/a |
| <a name="output_ses_event_destination"></a> [ses\_event\_destination](#output\_ses\_event\_destination) | n/a |
| <a name="output_ses_iam_role"></a> [ses\_iam\_role](#output\_ses\_iam\_role) | n/a |
| <a name="output_ses_sns_topic"></a> [ses\_sns\_topic](#output\_ses\_sns\_topic) | n/a |


# Terraform Amazon SES Module

## Introduction

This Terraform module sets up Amazon Simple Email Service (SES) with the necessary configurations for managing email sending and receiving for your domain. Amazon SES is a scalable and cost-effective service for sending and receiving email. This module is designed to help you integrate Amazon SES with your domain quickly and efficiently.

## Features

- Domain identity setup
- DKIM configuration
- Custom MAIL FROM domain
- Event destination configuration
- IAM role creation
- DNS record setup
- Easy integration with Terraform

## Prerequisites

Before using this module, make sure you have:

- An AWS account and AWS CLI configured
- Registered your domain with AWS Route 53 or another DNS provider
- Necessary AWS credentials with sufficient permissions

