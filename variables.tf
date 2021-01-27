variable "additional_endpoint_arns" {
  description = "Any alert endpoints, such as autoscaling, or app scaling endpoint arns that will respond to an alert"
  default     = []
  type        = list(string)
}

variable "sns_topic_arn" {
  description = "A list of ARNs (i.e. SNS Topic ARN) to notify on alerts"
  type        = list(string)
}

variable "region" {
  description = "The region that should be monitored for unauthorised AWS API Access. Current region used if none provied."
  default     = ""
  type        = string
}

variable "log_group_name" {
  description = "The cloudtrail cloudwatch log group name"
}

variable "metric_namespace" {
  description = "A namespace for grouping all of the metrics together"
  default     = "CloudTrailAlarms"
}

variable "metric_alarm_name_prefix" {
  description = "Prefix to add in all alarms. Current account alias if used if none provied."
  default     = ""
  type        = string
}

# api-authorization-failure
variable "api-authorization-failure" {
  description = "Enable api-authorization-failure alarm"
  default     = true
  type        = bool
}

variable "api-authorization-failure-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
  type        = string
}

variable "api-authorization-failure-period" {
  description = "Pattern used on filter"
  default     = 300
  type        = number
}

variable "api-authorization-failure-threshold" {
  description = "Pattern used on filter"
  default     = 1
  type        = number
}

# s3-bucket-activity-event
variable "s3-bucket-activity-event" {
  description = "Enable s3-bucket-activity-event alarm"
  default     = true
  type        = bool
}

variable "s3-bucket-activity-event-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
  type        = string
}

variable "s3-bucket-activity-event-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "s3-bucket-activity-event-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# security-group-event
variable "security-group-event" {
  description = "Enable security-group-event alarm"
  default     = true
  type        = bool
}

variable "security-group-event-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }"
  type        = string
}

variable "security-group-event-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "security-group-event-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# network-acl-event
variable "network-acl-event" {
  description = "Enable network-acl-event alarm"
  default     = true
  type        = bool
}

variable "network-acl-event-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
  type        = string
}

variable "network-acl-event-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "network-acl-event-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# gateway-event
variable "gateway-event" {
  description = "Enable gateway-event alarm"
  default     = true
  type        = bool
}

variable "gateway-event-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
  type        = string
}

variable "gateway-event-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "gateway-event-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# vpc-event
variable "vpc-event" {
  description = "Enable vpc-event alarm"
  default     = true
  type        = bool
}

variable "vpc-event-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"
  type        = string
}

variable "vpc-event-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "vpc-event-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# ec2-instance-event
variable "ec2-instance-event" {
  description = "Enable ec2-instance-event alarm"
  default     = true
  type        = bool
}

variable "ec2-instance-event-pattern" {
  description = "Pattern used on filter"
  default     = "{ (($.userIdentity.invokedBy != \"autoscaling.amazonaws.com\" && $.userIdentity.invokedBy != \"spot.amazonaws.com\") || $.userIdentity.invokedBy NOT EXISTS ) && ($.eventName = RunInstances || $.eventName = RebootInstances || $.eventName = StartInstances || $.eventName = StopInstances || $.eventName = TerminateInstances) }"
  type        = string
}

variable "ec2-instance-event-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "ec2-instance-event-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# ec2-large-instance-event
variable "ec2-large-instance-event" {
  description = "Enable ec2-large-instance-event alarm"
  default     = true
  type        = bool
}

variable "ec2-large-instance-event-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = RunInstances) && (($.requestParameters.instanceType = *.8xlarge) || ($.requestParameters.instanceType = *.4xlarge) || ($.requestParameters.instanceType = *.16xlarge) || ($.requestParameters.instanceType = *.10xlarge) || ($.requestParameters.instanceType = *.12xlarge) || ($.requestParameters.instanceType = *.24xlarge)) }"
  type        = string
}

variable "ec2-large-instance-event-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "ec2-large-instance-event-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# cloudtrail-event
variable "cloudtrail-event" {
  description = "Enable cloudtrail-event alarm"
  default     = true
  type        = bool
}

variable "cloudtrail-event-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
  type        = string
}

variable "cloudtrail-event-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "cloudtrail-event-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# console-sign-in-failure
variable "console-sign-in-failure" {
  description = "Enable console-sign-in-failure alarm"
  default     = true
  type        = bool
}

variable "console-sign-in-failure-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
  type        = string
}

variable "console-sign-in-failure-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "console-sign-in-failure-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# iam-policy-change
variable "iam-policy-change" {
  description = "Enable iam-policy-change alarm"
  default     = true
  type        = bool
}

variable "iam-policy-change-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = DeleteGroupPolicy) || ($.eventName = DeleteRolePolicy) ||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
  type        = string
}

variable "iam-policy-change-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "iam-policy-change-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# console-sign-in-without-mfa
variable "console-sign-in-without-mfa" {
  description = "Enable console-sign-in-without-mfa alarm"
  default     = true
  type        = bool
}

variable "console-sign-in-without-mfa-pattern" {
  description = "Pattern used on filter"
  default     = "{ $.eventName = \"ConsoleLogin\" && $.additionalEventData.MFAUsed = \"No\" }"
  type        = string
}

variable "console-sign-in-without-mfa-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "console-sign-in-without-mfa-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# root-account-usage
variable "root-account-usage" {
  description = "Enable root-account-usage alarm"
  default     = true
  type        = bool
}

variable "root-account-usage-pattern" {
  description = "Pattern used on filter"
  default     = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
  type        = string
}

variable "root-account-usage-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "root-account-usage-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# kms-key-pending-deletion-error
variable "kms-key-pending-deletion-error" {
  description = "Enable kms-key-pending-deletion-error alarm"
  default     = true
  type        = bool
}

variable "kms-key-pending-deletion-error-pattern" {
  description = "Pattern used on filter"
  default     = "{ $.eventSource = kms* && $.errorMessage = \"* is pending deletion.\"}"
  type        = string
}

variable "kms-key-pending-deletion-error-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "kms-key-pending-deletion-error-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# aws-config-change
variable "aws-config-change" {
  description = "Enable aws-config-change alarm"
  default     = true
  type        = bool
}

variable "aws-config-change-pattern" {
  description = "Pattern used on filter"
  default     = "{ $.eventSource = config.amazonaws.com && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel) ||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }"
  type        = string
}

variable "aws-config-change-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "aws-config-change-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# route-table-changes
variable "route-table-changes" {
  description = "Enable route-table-changes alarm"
  default     = true
  type        = bool
}

variable "route-table-changes-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
  type        = string
}

variable "route-table-changes-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "route-table-changes-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

# backup-plan-job-failed
variable "backup-plan-job-failed" {
  description = "Enable backup-plan-job-failed alarm"
  default     = true
  type        = bool
}

variable "backup-plan-job-failed-pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventSource = backup.amazonaws.com) && ($.eventName = BackupJobCompleted) && ($.errorCode = FAILED) }"
  type        = string
}

variable "backup-plan-job-failed-period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "backup-plan-job-failed-threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}
