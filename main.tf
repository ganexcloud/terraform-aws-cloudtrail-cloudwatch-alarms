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
  pattern        = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to S3 to put or delete a Bucket, Bucket Policy or Bucket ACL."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

# security-group-event
resource "aws_cloudwatch_log_metric_filter" "security-group-event" {
  count          = var.security-group-event ? 1 : 0
  name           = "security-group-event"
  pattern        = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to create, update or delete a Security Group."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "network-acl-event" {
  count          = var.network-acl-event ? 1 : 0
  name           = "network-acl-event"
  pattern        = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to create, update or delete a Network ACL."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "gateway-event" {
  count          = var.gateway-event ? 1 : 0
  name           = "gateway-event"
  pattern        = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to create, update or delete a Customer or Internet Gateway."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "vpc-event" {
  count          = var.vpc-event ? 1 : 0
  name           = "vpc-event"
  pattern        = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to create, update or delete a VPC, VPC peering connection or VPC connection to classic."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "ec2-instance-event" {
  count          = var.ec2-instance-event ? 1 : 0
  name           = "ec2-instance-event"
  pattern        = "{ (($.userIdentity.invokedBy != \"autoscaling.amazonaws.com\" && $.userIdentity.invokedBy != \"spot.amazonaws.com\") || $.userIdentity.invokedBy NOT EXISTS ) && ($.eventName = RunInstances || $.eventName = RebootInstances || $.eventName = StartInstances || $.eventName = StopInstances || $.eventName = TerminateInstances) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot an EC2 instance."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "ec2-large-instance-event" {
  count          = var.ec2-large-instance-event ? 1 : 0
  name           = "ec2-large-instance-event"
  pattern        = "{ ($.eventName = RunInstances) && (($.requestParameters.instanceType = *.8xlarge) || ($.requestParameters.instanceType = *.4xlarge) || ($.requestParameters.instanceType = *.16xlarge) || ($.requestParameters.instanceType = *.10xlarge) || ($.requestParameters.instanceType = *.12xlarge) || ($.requestParameters.instanceType = *.24xlarge)) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot a 4x-large or greater EC2 instance."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "cloudtrail-event" {
  count          = var.cloudtrail-event ? 1 : 0
  name           = "cloudtrail-event"
  pattern        = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to create, update or delete a .cloudtrail. trail, or to start or stop logging to a trail."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "console-sign-in-failure" {
  count          = var.console-sign-in-failure ? 1 : 0
  name           = "console-sign-in-failure"
  pattern        = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an unauthenticated API call is made to sign into the console."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "iam-policy-change" {
  count          = var.iam-policy-change ? 1 : 0
  name           = "iam-policy-change"
  pattern        = "{ ($.eventName = DeleteGroupPolicy) || ($.eventName = DeleteRolePolicy) ||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an API call is made to change an IAM policy."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "console-sign-in-without-mfa" {
  count          = var.console-sign-in-without-mfa ? 1 : 0
  name           = "console-sign-in-without-mfa"
  pattern        = "{ $.eventName = \"ConsoleLogin\" && $.additionalEventData.MFAUsed = \"No\" }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when a user logs into the console without MFA."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "root-account-usage" {
  count          = var.root-account-usage ? 1 : 0
  name           = "root-account-usage"
  pattern        = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when a root account usage is detected."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "kms-key-pending-deletion-error" {
  count          = var.kms-key-pending-deletion-error ? 1 : 0
  name           = "kms-key-pending-deletion-error"
  pattern        = "{ $.eventSource = kms* && $.errorMessage = \"* is pending deletion.\"}"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when a customer created KMS key is pending deletion."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "aws-config-change" {
  count          = var.aws-config-change ? 1 : 0
  name           = "aws-config-change"
  pattern        = "{ $.eventSource = config.amazonaws.com && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel) ||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when AWS Config changes."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "route-table-changes" {
  count          = var.route-table-changes ? 1 : 0
  name           = "route-table-changes"
  pattern        = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when route table changes are detected."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}

resource "aws_cloudwatch_log_metric_filter" "backup-plan-job-failed" {
  count          = var.backup-plan-job-failed ? 1 : 0
  name           = "backup-plan-job-failed"
  pattern        = "{ ($.eventSource = backup.amazonaws.com) && ($.eventName = BackupJobCompleted) && ($.errorCode = FAILED) }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when a backup job failed on Backup Plan."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}
