locals {
  alert_for                = "cloudtrail-alarms"
  sns_topic_arn            = "${var.sns_topic_arn == "" ? aws_sns_topic.default.arn : var.sns_topic_arn }"
  endpoints                = "${distinct(compact(concat(list(local.sns_topic_arn), var.additional_endpoint_arns)))}"
  region                   = "${var.region == "" ? data.aws_region.current.name : var.region}"
  metric_alarm_name_prefix = "${var.metric_alarm_name_prefix == "" ? data.aws_iam_account_alias.current.account_alias : var.metric_alarm_name_prefix }"

  metric_name = [
    "api-authorization-failure",
    "s3-bucket-activity-event",
    "security-group-event",
    "network-acl-event",
    "gateway-event",
    "vpc-event",
    "ec2-instance-event",
    "ec2-large-instance-event",
    "cloudtrail-event",
    "console-sign-in-failure",
    "iam-policy-change",
    "console-sign-in-without-mfa",
    "root-account-usage",
    "kms-key-pending-deletion-error",
    "aws-config-change",
    "route-table-changes",
    "backup-plan-job-failed",
  ]

  metric_namespace = "${var.metric_namespace}"
  metric_value     = "1"

  filter_pattern = [
    "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }",
    "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }",
    "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }",
    "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }",
    "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }",
    "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }",
    "{ (($.userIdentity.invokedBy != \"autoscaling.amazonaws.com\" && $.userIdentity.invokedBy != \"spot.amazonaws.com\") || $.userIdentity.invokedBy NOT EXISTS ) && ($.eventName = RunInstances || $.eventName = RebootInstances || $.eventName = StartInstances || $.eventName = StopInstances || $.eventName = TerminateInstances) }",
    "{ ($.eventName = RunInstances) && (($.requestParameters.instanceType = *.8xlarge) || ($.requestParameters.instanceType = *.4xlarge) || ($.requestParameters.instanceType = *.16xlarge) || ($.requestParameters.instanceType = *.10xlarge) || ($.requestParameters.instanceType = *.12xlarge) || ($.requestParameters.instanceType = *.24xlarge)) }",
    "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }",
    "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }",
    "{ ($.eventName = DeleteGroupPolicy) || ($.eventName = DeleteRolePolicy) ||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}",
    "{ $.eventName = \"ConsoleLogin\" && $.additionalEventData.MFAUsed = \"No\" }",
    "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }",
    "{ $.eventSource = kms* && $.errorMessage = \"* is pending deletion.\"}",
    "{ $.eventSource = config.amazonaws.com && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel) ||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }",
    "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }",
    "{ ($.eventSource = backup.amazonaws.com) && ($.eventName = BackupJobCompleted) && ($.errorCode = FAILED) }",
  ]

  alarm_description = [
    "Alarms when an unauthorized API call is made.",
    "Alarms when an API call is made to S3 to put or delete a Bucket, Bucket Policy or Bucket ACL.",
    "Alarms when an API call is made to create, update or delete a Security Group.",
    "Alarms when an API call is made to create, update or delete a Network ACL.",
    "Alarms when an API call is made to create, update or delete a Customer or Internet Gateway.",
    "Alarms when an API call is made to create, update or delete a VPC, VPC peering connection or VPC connection to classic.",
    "Alarms when an API call is made to create, terminate, start, stop or reboot an EC2 instance.",
    "Alarms when an API call is made to create, terminate, start, stop or reboot a 4x-large or greater EC2 instance.",
    "Alarms when an API call is made to create, update or delete a .cloudtrail. trail, or to start or stop logging to a trail.",
    "Alarms when an unauthenticated API call is made to sign into the console.",
    "Alarms when an API call is made to change an IAM policy.",
    "Alarms when a user logs into the console without MFA.",
    "Alarms when a root account usage is detected.",
    "Alarms when a customer created KMS key is pending deletion.",
    "Alarms when AWS Config changes.",
    "Alarms when route table changes are detected.",
    "Alarms when a backup job failed on Backup Plan.",
  ]
}
