data "aws_caller_identity" "default" {}
data "aws_region" "current" {}
data "aws_iam_account_alias" "current" {}

# api-authorization-failure
resource "aws_cloudwatch_log_metric_filter" "api_authorization_failure" {
  count          = var.api_authorization_failure_enabled ? 1 : 0
  name           = "api-authorization-failure"
  pattern        = var.api_authorization_failure_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "api-authorization-failure"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "api_authorization_failure" {
  count               = var.api_authorization_failure_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] api-authorization-failure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "api-authorization-failure"
  namespace           = var.metric_namespace
  period              = var.api_authorization_failure_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.api_authorization_failure_threshold
  alarm_description   = "Alarms when an unauthorized API call is made. (${var.api_authorization_failure_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# s3-bucket-activity-event
resource "aws_cloudwatch_log_metric_filter" "s3_bucket_activity_event" {
  count          = var.s3_bucket_activity_event_enabled ? 1 : 0
  name           = "s3-bucket-activity-event"
  pattern        = var.s3_bucket_activity_event_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "s3-bucket-activity-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_bucket_activity_event" {
  count               = var.s3_bucket_activity_event_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] s3-bucket-activity-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "s3-bucket-activity-event"
  namespace           = var.metric_namespace
  period              = var.s3_bucket_activity_event_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.s3_bucket_activity_event_threshold
  alarm_description   = "Alarms when an API call is made to S3 to put or delete a Bucket, Bucket Policy or Bucket ACL. (${var.s3_bucket_activity_event_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# security-group-event
resource "aws_cloudwatch_log_metric_filter" "security_group_event" {
  count          = var.security_group_event_enabled ? 1 : 0
  name           = "security-group-event"
  pattern        = var.security_group_event_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "security-group-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "security_group_event" {
  count               = var.security_group_event_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] security-group-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "security-group-event"
  namespace           = var.metric_namespace
  period              = var.security_group_event_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.security_group_event_threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a Security Group. (${var.security_group_event_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# network-acl-event
resource "aws_cloudwatch_log_metric_filter" "network_acl_event" {
  count          = var.network_acl_event_enabled ? 1 : 0
  name           = "network-acl-event"
  pattern        = var.network_acl_event_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "network-acl-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "network_acl_event" {
  count               = var.network_acl_event_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] network-acl-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "network-acl-event"
  namespace           = var.metric_namespace
  period              = var.network_acl_event_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.network_acl_event_threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a Network ACL. (${var.network_acl_event_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# gateway-event
resource "aws_cloudwatch_log_metric_filter" "gateway_event" {
  count          = var.gateway_event_enabled ? 1 : 0
  name           = "gateway-event"
  pattern        = var.gateway_event_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "gateway-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "gateway_event" {
  count               = var.gateway_event_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] gateway-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "gateway-event"
  namespace           = var.metric_namespace
  period              = var.gateway_event_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.gateway_event_threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a Customer or Internet Gateway. (${var.gateway_event_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# vpc-event
resource "aws_cloudwatch_log_metric_filter" "vpc_event" {
  count          = var.vpc_event_enabled ? 1 : 0
  name           = "vpc-event"
  pattern        = var.vpc_event_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "vpc-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "vpc_event" {
  count               = var.vpc_event_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] vpc-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "vpc-event"
  namespace           = var.metric_namespace
  period              = var.vpc_event_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.vpc_event_threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a VPC, VPC peering connection or VPC connection to classic. (${var.vpc_event_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# ec2-instance-event
resource "aws_cloudwatch_log_metric_filter" "ec2_instance_event" {
  count          = var.ec2_instance_event_enabled ? 1 : 0
  name           = "ec2-instance-event"
  pattern        = var.ec2_instance_event_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "ec2-instance-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_instance_event" {
  count               = var.ec2_instance_event_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] ec2-instance-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ec2-instance-event"
  namespace           = var.metric_namespace
  period              = var.ec2_instance_event_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.ec2_instance_event_threshold
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot an EC2 instance. (${var.ec2_instance_event_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# ec2-large-instance-event
resource "aws_cloudwatch_log_metric_filter" "ec2_large_instance_event" {
  count          = var.ec2_large_instance_event_enabled ? 1 : 0
  name           = "ec2-large-instance-event"
  pattern        = var.ec2_large_instance_event_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "ec2-large-instance-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_large_instance_event" {
  count               = var.ec2_large_instance_event_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] ec2-large-instance-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ec2-large-instance-event"
  namespace           = var.metric_namespace
  period              = var.ec2_large_instance_event_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.ec2_large_instance_event_threshold
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot a 4x-large or greater EC2 instance. (${var.ec2_large_instance_event_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# cloudtrail-event
resource "aws_cloudwatch_log_metric_filter" "cloudtrail_event" {
  count          = var.cloudtrail_event_enabled ? 1 : 0
  name           = "cloudtrail-event"
  pattern        = var.cloudtrail_event_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "cloudtrail-event"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "cloudtrail_event" {
  count               = var.cloudtrail_event_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] cloudtrail-event"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "cloudtrail-event"
  namespace           = var.metric_namespace
  period              = var.cloudtrail_event_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.cloudtrail_event_threshold
  alarm_description   = "Alarms when an API call is made to create, update or delete a .cloudtrail. trail, or to start or stop logging to a trail. (${var.cloudtrail_event_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# console-sign-in-failure
resource "aws_cloudwatch_log_metric_filter" "console_sign_in_failure" {
  count          = var.console_sign_in_failure_enabled ? 1 : 0
  name           = "console-sign-in-failure"
  pattern        = var.console_sign_in_failure_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "console-sign-in-failure"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "console_sign_in_failure" {
  count               = var.console_sign_in_failure_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] console-sign-in-failure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "console-sign-in-failure"
  namespace           = var.metric_namespace
  period              = var.console_sign_in_failure_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.console_sign_in_failure_threshold
  alarm_description   = "Alarms when an unauthenticated API call is made to sign into the console. (${var.console_sign_in_failure_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# iam-policy-change
resource "aws_cloudwatch_log_metric_filter" "iam_policy_change" {
  count          = var.iam_policy_change_enabled ? 1 : 0
  name           = "iam-policy-change"
  pattern        = var.iam_policy_change_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "iam-policy-change"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "iam_policy_change" {
  count               = var.iam_policy_change_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] iam-policy-change"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "iam-policy-change"
  namespace           = var.metric_namespace
  period              = var.iam_policy_change_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.iam_policy_change_threshold
  alarm_description   = "Alarms when an API call is made to change an IAM policy. (${var.iam_policy_change_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# console-sign-in-without-mfa
resource "aws_cloudwatch_log_metric_filter" "console_sign_in_without_mfa" {
  count          = var.console_sign_in_without_mfa_enabled ? 1 : 0
  name           = "console-sign-in-without-mfa"
  pattern        = var.console_sign_in_without_mfa_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "console-sign-in-without-mfa"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "console_sign_in_without_mfa" {
  count               = var.console_sign_in_without_mfa_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] console-sign-in-without-mfa"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "console-sign-in-without-mfa"
  namespace           = var.metric_namespace
  period              = var.console_sign_in_without_mfa_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.console_sign_in_without_mfa_threshold
  alarm_description   = "Alarms when a user logs into the console without MFA. (${var.console_sign_in_without_mfa_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# root-account-usage
resource "aws_cloudwatch_log_metric_filter" "root_account_usage" {
  count          = var.root_account_usage_enabled ? 1 : 0
  name           = "root-account-usage"
  pattern        = var.root_account_usage_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "root-account-usage"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "root_account_usage" {
  count               = var.root_account_usage_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] root-account-usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "root-account-usage"
  namespace           = var.metric_namespace
  period              = var.root_account_usage_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.root_account_usage_threshold
  alarm_description   = "Alarms when a root account usage is detected. (${var.root_account_usage_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# kms-key-pending-deletion-error
resource "aws_cloudwatch_log_metric_filter" "kms-key-pending-deletion-error" {
  count          = var.kms_key_pending_deletion_error_enabled ? 1 : 0
  name           = "kms-key-pending-deletion-error"
  pattern        = var.kms_key_pending_deletion_error_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "kms-key-pending-deletion-error"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "kms-key-pending-deletion-error" {
  count               = var.kms_key_pending_deletion_error_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] kms-key-pending-deletion-error"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "kms-key-pending-deletion-error"
  namespace           = var.metric_namespace
  period              = var.kms_key_pending_deletion_error_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.kms_key_pending_deletion_error_threshold
  alarm_description   = "Alarms when a customer created KMS key is pending deletion. (${var.kms_key_pending_deletion_error_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# aws-config-change
resource "aws_cloudwatch_log_metric_filter" "aws_config_change" {
  count          = var.aws_config_change_enabled ? 1 : 0
  name           = "aws-config-change"
  pattern        = var.aws_config_change_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "aws-config-change"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "aws_config_change" {
  count               = var.aws_config_change_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] aws-config-change"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "aws-config-change"
  namespace           = var.metric_namespace
  period              = var.aws_config_change_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.aws_config_change_threshold
  alarm_description   = "Alarms when AWS Config changes. (${var.aws_config_change_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# route-table-changes
resource "aws_cloudwatch_log_metric_filter" "route_table_changes" {
  count          = var.route_table_changes_enabled ? 1 : 0
  name           = "route-table-changes"
  pattern        = var.route_table_changes_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "route-table-changes"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "route_table_changes" {
  count               = var.route_table_changes_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] route-table-changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "route-table-changes"
  namespace           = var.metric_namespace
  period              = var.route_table_changes_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.route_table_changes_threshold
  alarm_description   = "Alarms when route table changes are detected. (${var.route_table_changes_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# backup-plan-job-failed
resource "aws_cloudwatch_log_metric_filter" "backup_plan_job_failed" {
  count          = var.backup_plan_job_failed_enabled ? 1 : 0
  name           = "backup-plan-job-failed"
  pattern        = var.backup_plan_job_failed_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "backup-plan-job-failed"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "backup_plan_job_failed" {
  count               = var.backup_plan_job_failed_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] backup-plan-job-failed"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "backup-plan-job-failed"
  namespace           = var.metric_namespace
  period              = var.backup_plan_job_failed_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.backup_plan_job_failed_threshold
  alarm_description   = "Alarms when a backup job failed on Backup Plan. (${var.backup_plan_job_failed_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# organizations-changes
resource "aws_cloudwatch_log_metric_filter" "aws_organizations_changes" {
  count          = var.aws_organizations_changes_enabled ? 1 : 0
  name           = "aws-organizations-changes"
  pattern        = var.aws_organizations_changes_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "aws-organizations-changes"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "aws_organizations_changes" {
  count               = var.aws_organizations_changes_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] aws organizations changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "aws-organizations-changes"
  namespace           = var.metric_namespace
  period              = var.aws_organizations_changes_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.aws_organizations_changes_threshold
  alarm_description   = "Alarms when a organizations changes at AWS Account. (${var.aws_organizations_changes_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}

# disable-or-scheduled-deletion-of-kms-cmk
resource "aws_cloudwatch_log_metric_filter" "disable_or_scheduled_deletion_of_kms_cmk" {
  count          = var.disable_or_scheduled_deletion_of_kms_cmk_enabled ? 1 : 0
  name           = "disable-or-scheduled-deletion-of-kms-cmk"
  pattern        = var.disable_or_scheduled_deletion_of_kms_cmk_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "disable-or-scheduled-deletion-of-kms-cmk"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "disable_or_scheduled_deletion_of_kms_cmk" {
  count               = var.disable_or_scheduled_deletion_of_kms_cmk_enabled ? 1 : 0
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] disable or scheduled deletion of kms cmk"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "disable-or-scheduled-deletion-of-kms-cmk"
  namespace           = var.metric_namespace
  period              = var.disable_or_scheduled_deletion_of_kms_cmk_period
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = var.disable_or_scheduled_deletion_of_kms_cmk_threshold
  alarm_description   = "Alarms when a kms cmk is disabled or scheduled deletion. (${var.disable_or_scheduled_deletion_of_kms_cmk_priority})"
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
  tags                = var.tags
}