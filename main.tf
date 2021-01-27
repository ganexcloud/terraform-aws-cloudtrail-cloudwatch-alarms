data "aws_caller_identity" "default" {}

data "aws_region" "current" {}

data "aws_iam_account_alias" "current" {}

# api-authorization-failure
resource "aws_cloudwatch_log_metric_filter" "api_authorization_failure" {
  count          = var.api-authorization-failure ? 1 : 0
  name           = "api-authorization-failure"
  pattern        = var.api-authorization-failure-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "api-authorization-failure"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "api_authorization_failure" {
  count               = var.api-authorization-failure ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] api-authorization-failure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "api-authorization-failure"
  namespace           = var.metric_namespace
  period              = var.api-authorization-failure-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.api-authorization-failure-threshold
  alarm_description   = "Alarms when an unauthorized API call is made."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# s3-bucket-activity-event
resource "aws_cloudwatch_log_metric_filter" "s3-bucket-activity-event" {
  count          = var.s3-bucket-activity-event ? 1 : 0
  name           = "s3-bucket-activity-event"
  pattern        = var.s3-bucket-activity-event-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "s3-bucket-activity-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "s3-bucket-activity-event" {
  count               = var.s3-bucket-activity-event ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] s3-bucket-activity-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "s3-bucket-activity-event"
  namespace           = var.metric_namespace
  period              = var.s3-bucket-activity-event-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.s3-bucket-activity-event-threshold
  alarm_description   = "Alarms when an API call is made to S3 to put or delete a Bucket, Bucket Policy or Bucket ACL."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# security-group-event
resource "aws_cloudwatch_log_metric_filter" "security-group-event" {
  count          = var.security-group-event ? 1 : 0
  name           = "security-group-event"
  pattern        = var.security-group-event-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "security-group-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "security-group-event" {
  count               = var.security-group-event ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] security-group-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "security-group-event"
  namespace           = var.metric_namespace
  period              = var.security-group-event-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.security-group-event-threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a Security Group."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# network-acl-event
resource "aws_cloudwatch_log_metric_filter" "network-acl-event" {
  count          = var.network-acl-event ? 1 : 0
  name           = "network-acl-event"
  pattern        = var.network-acl-event-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "network-acl-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "network-acl-event" {
  count               = var.network-acl-event ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] network-acl-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "network-acl-event"
  namespace           = var.metric_namespace
  period              = var.network-acl-event-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.network-acl-event-threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a Network ACL."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# gateway-event
resource "aws_cloudwatch_log_metric_filter" "gateway-event" {
  count          = var.gateway-event ? 1 : 0
  name           = "gateway-event"
  pattern        = var.gateway-event-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "gateway-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "gateway-event" {
  count               = var.gateway-event ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] gateway-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "gateway-event"
  namespace           = var.metric_namespace
  period              = var.gateway-event-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.gateway-event-threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a Customer or Internet Gateway."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

#vpc-event
resource "aws_cloudwatch_log_metric_filter" "vpc-event" {
  count          = var.vpc-event ? 1 : 0
  name           = "vpc-event"
  pattern        = var.vpc-event-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "vpc-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "vpc-event" {
  count               = var.vpc-event ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] vpc-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "vpc-event"
  namespace           = var.metric_namespace
  period              = var.vpc-event-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.vpc-event-threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a VPC, VPC peering connection or VPC connection to classic."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# ec2-instance-event
resource "aws_cloudwatch_log_metric_filter" "ec2-instance-event" {
  count          = var.ec2-instance-event ? 1 : 0
  name           = "ec2-instance-event"
  pattern        = var.ec2-instance-event-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "ec2-instance-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2-instance-event" {
  count               = var.ec2-instance-event ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] ec2-instance-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ec2-instance-event"
  namespace           = var.metric_namespace
  period              = var.ec2-instance-event-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.ec2-instance-event-threshold
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot an EC2 instance."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# ec2-large-instance-event
resource "aws_cloudwatch_log_metric_filter" "ec2-large-instance-event" {
  count          = var.ec2-large-instance-event ? 1 : 0
  name           = "ec2-large-instance-event"
  pattern        = var.ec2-large-instance-event-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "ec2-large-instance-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2-large-instance-event" {
  count               = var.ec2-large-instance-event ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] ec2-large-instance-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ec2-large-instance-event"
  namespace           = var.metric_namespace
  period              = var.ec2-large-instance-event-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.ec2-large-instance-event-threshold
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot a 4x-large or greater EC2 instance."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# cloudtrail-event
resource "aws_cloudwatch_log_metric_filter" "cloudtrail-event" {
  count          = var.cloudtrail-event ? 1 : 0
  name           = "cloudtrail-event"
  pattern        = var.cloudtrail-event-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "cloudtrail-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "cloudtrail-event" {
  count               = var.cloudtrail-event ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] cloudtrail-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "cloudtrail-event"
  namespace           = var.metric_namespace
  period              = var.cloudtrail-event-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.cloudtrail-event-threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a .cloudtrail. trail, or to start or stop logging to a trail."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# console-sign-in-failure
resource "aws_cloudwatch_log_metric_filter" "console-sign-in-failure" {
  count          = var.console-sign-in-failure ? 1 : 0
  name           = "console-sign-in-failure"
  pattern        = var.console-sign-in-failure-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "console-sign-in-failure"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "console-sign-in-failure" {
  count               = var.console-sign-in-failure ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] console-sign-in-failure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "console-sign-in-failure"
  namespace           = var.metric_namespace
  period              = var.console-sign-in-failure-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.console-sign-in-failure-threshold
  alarm_description   = "Alarms when an unauthenticated API call is made to sign into the console."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# iam-policy-change
resource "aws_cloudwatch_log_metric_filter" "iam-policy-change" {
  count          = var.iam-policy-change ? 1 : 0
  name           = "iam-policy-change"
  pattern        = var.iam-policy-change-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "iam-policy-change"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "iam-policy-change" {
  count               = var.iam-policy-change ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] iam-policy-change"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "iam-policy-change"
  namespace           = var.metric_namespace
  period              = var.iam-policy-change-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.iam-policy-change-threshold
  alarm_description   = "Alarms when an API call is made to change an IAM policy."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# console-sign-in-without-mfa
resource "aws_cloudwatch_log_metric_filter" "console-sign-in-without-mfa" {
  count          = var.console-sign-in-without-mfa ? 1 : 0
  name           = "console-sign-in-without-mfa"
  pattern        = var.console-sign-in-without-mfa-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "console-sign-in-without-mfa"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "console-sign-in-without-mfa" {
  count               = var.console-sign-in-without-mfa ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] console-sign-in-without-mfa"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "console-sign-in-without-mfa"
  namespace           = var.metric_namespace
  period              = var.console-sign-in-without-mfa-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.console-sign-in-without-mfa-threshold
  alarm_description   = "Alarms when a user logs into the console without MFA."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# root-account-usage
resource "aws_cloudwatch_log_metric_filter" "root-account-usage" {
  count          = var.root-account-usage ? 1 : 0
  name           = "root-account-usage"
  pattern        = var.root-account-usage-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "root-account-usage"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "root-account-usage" {
  count               = var.root-account-usage ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] root-account-usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "root-account-usage"
  namespace           = var.metric_namespace
  period              = var.root-account-usage-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.root-account-usage-threshold
  alarm_description   = "Alarms when a root account usage is detected."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# kms-key-pending-deletion-error
resource "aws_cloudwatch_log_metric_filter" "kms-key-pending-deletion-error" {
  count          = var.kms-key-pending-deletion-error ? 1 : 0
  name           = "kms-key-pending-deletion-error"
  pattern        = var.kms-key-pending-deletion-error-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "kms-key-pending-deletion-error"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "kms-key-pending-deletion-error" {
  count               = var.kms-key-pending-deletion-error ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] kms-key-pending-deletion-error"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "kms-key-pending-deletion-error"
  namespace           = var.metric_namespace
  period              = var.kms-key-pending-deletion-error-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.kms-key-pending-deletion-error-threshold
  alarm_description   = "Alarms when a customer created KMS key is pending deletion."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# aws-config-change
resource "aws_cloudwatch_log_metric_filter" "aws-config-change" {
  count          = var.aws-config-change ? 1 : 0
  name           = "aws-config-change"
  pattern        = var.aws-config-change-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "aws-config-change"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "aws-config-change" {
  count               = var.aws-config-change ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] aws-config-change"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "aws-config-change"
  namespace           = var.metric_namespace
  period              = var.aws-config-change-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.aws-config-change-threshold
  alarm_description   = "Alarms when AWS Config changes."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# route-table-changes
resource "aws_cloudwatch_log_metric_filter" "route-table-changes" {
  count          = var.route-table-changes ? 1 : 0
  name           = "route-table-changes"
  pattern        = var.route-table-changes-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "route-table-changes"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "route-table-changes" {
  count               = var.route-table-changes ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] route-table-changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "route-table-changes"
  namespace           = var.metric_namespace
  period              = var.route-table-changes-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.route-table-changes-threshold
  alarm_description   = "Alarms when route table changes are detected."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# backup-plan-job-failed
resource "aws_cloudwatch_log_metric_filter" "backup-plan-job-failed" {
  count          = var.backup-plan-job-failed ? 1 : 0
  name           = "backup-plan-job-failed"
  pattern        = var.backup-plan-job-failed-pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "backup-plan-job-failed"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "backup-plan-job-failed" {
  count               = var.backup-plan-job-failed ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] backup-plan-job-failed"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "backup-plan-job-failed"
  namespace           = var.metric_namespace
  period              = var.backup-plan-job-failed-period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.backup-plan-job-failed-threshold
  alarm_description   = "Alarms when a backup job failed on Backup Plan."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}
