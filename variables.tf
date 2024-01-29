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
variable "api_authorization_failure_enabled" {
  description = "Enable api-authorization-failure alarm"
  default     = true
  type        = bool
}

variable "api_authorization_failure_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
  type        = string
}

variable "api_authorization_failure_period" {
  description = "Pattern used on filter"
  default     = 300
  type        = number
}

variable "api_authorization_failure_threshold" {
  description = "Pattern used on filter"
  default     = 10
  type        = number
}

variable "api_authorization_failure_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# s3-bucket-activity-event
variable "s3_bucket_activity_event_enabled" {
  description = "Enable s3-bucket-activity-event alarm"
  default     = true
  type        = bool
}

variable "s3_bucket_activity_event_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
  type        = string
}

variable "s3_bucket_activity_event_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "s3_bucket_activity_event_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "s3_bucket_activity_event_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# security-group-event
variable "security_group_event_enabled" {
  description = "Enable security-group-event alarm"
  default     = true
  type        = bool
}

variable "security_group_event_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }"
  type        = string
}

variable "security_group_event_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "security_group_event_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "security_group_event_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# network-acl-event
variable "network_acl_event_enabled" {
  description = "Enable network-acl-event alarm"
  default     = true
  type        = bool
}

variable "network_acl_event_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
  type        = string
}

variable "network_acl_event_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "network_acl_event_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "network_acl_event_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# gateway-event
variable "gateway_event_enabled" {
  description = "Enable gateway-event alarm"
  default     = true
  type        = bool
}

variable "gateway_event_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
  type        = string
}

variable "gateway_event_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "gateway_event_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "gateway_event_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# vpc-event
variable "vpc_event_enabled" {
  description = "Enable vpc-event alarm"
  default     = true
  type        = bool
}

variable "vpc_event_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"
  type        = string
}

variable "vpc_event_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "vpc_event_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "vpc_event_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# ec2-instance-event
variable "ec2_instance_event_enabled" {
  description = "Enable ec2-instance-event alarm"
  default     = true
  type        = bool
}

variable "ec2_instance_event_pattern" {
  description = "Pattern used on filter"
  default     = "{ (($.userIdentity.invokedBy != \"autoscaling.amazonaws.com\" && $.userIdentity.invokedBy != \"spot.amazonaws.com\") || $.userIdentity.invokedBy NOT EXISTS ) && ($.eventName = RunInstances || $.eventName = RebootInstances || $.eventName = StartInstances || $.eventName = StopInstances || $.eventName = TerminateInstances) }"
  type        = string
}

variable "ec2_instance_event_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "ec2_instance_event_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "ec2_instance_event_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# ec2-large-instance-event
variable "ec2_large_instance_event_enabled" {
  description = "Enable ec2-large-instance-event alarm"
  default     = true
  type        = bool
}

variable "ec2_large_instance_event_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = RunInstances) && (($.requestParameters.instanceType = *.8xlarge) || ($.requestParameters.instanceType = *.4xlarge) || ($.requestParameters.instanceType = *.16xlarge) || ($.requestParameters.instanceType = *.10xlarge) || ($.requestParameters.instanceType = *.12xlarge) || ($.requestParameters.instanceType = *.24xlarge)) }"
  type        = string
}

variable "ec2_large_instance_event_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "ec2_large_instance_event_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "ec2_large_instance_event_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# cloudtrail-event
variable "cloudtrail_event_enabled" {
  description = "Enable cloudtrail-event alarm"
  default     = true
  type        = bool
}

variable "cloudtrail_event_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
  type        = string
}

variable "cloudtrail_event_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "cloudtrail_event_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "cloudtrail_event_priority" {
  description = "Priority of alarm"
  default     = "P4"
  type        = string
}

# console-sign-in-failure
variable "console_sign_in_failure_enabled" {
  description = "Enable console-sign-in-failure alarm"
  default     = true
  type        = bool
}

variable "console_sign_in_failure_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
  type        = string
}

variable "console_sign_in_failure_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "console_sign_in_failure_threshold" {
  description = "Threshold used on filter"
  default     = 3
  type        = number
}

variable "console_sign_in_failure_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# iam-policy-change
variable "iam_policy_change_enabled" {
  description = "Enable iam-policy-change alarm"
  default     = true
  type        = bool
}

variable "iam_policy_change_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = DeleteGroupPolicy) || ($.eventName = DeleteRolePolicy) ||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
  type        = string
}

variable "iam_policy_change_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "iam_policy_change_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "iam_policy_change_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# console-sign-in-without-mfa
variable "console_sign_in_without_mfa_enabled" {
  description = "Enable console-sign-in-without-mfa alarm"
  default     = false
  type        = bool
}

variable "console_sign_in_without_mfa_pattern" {
  description = "Pattern used on filter"
  default     = "{ $.eventName = \"ConsoleLogin\" && $.additionalEventData.MFAUsed = \"No\" }"
  type        = string
}

variable "console_sign_in_without_mfa_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "console_sign_in_without_mfa_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "console_sign_in_without_mfa_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# root-account-usage
variable "root_account_usage_enabled" {
  description = "Enable root-account-usage alarm"
  default     = true
  type        = bool
}

variable "root_account_usage_pattern" {
  description = "Pattern used on filter"
  default     = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
  type        = string
}

variable "root_account_usage_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "root_account_usage_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "root_account_usage_priority" {
  description = "Priority of alarm"
  default     = "P2"
  type        = string
}

# kms-key-pending-deletion-error
variable "kms_key_pending_deletion_error_enabled" {
  description = "Enable kms-key-pending-deletion-error alarm"
  default     = true
  type        = bool
}

variable "kms_key_pending_deletion_error_pattern" {
  description = "Pattern used on filter"
  default     = "{ $.eventSource = kms* && $.errorMessage = \"* is pending deletion.\"}"
  type        = string
}

variable "kms_key_pending_deletion_error_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "kms_key_pending_deletion_error_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "kms_key_pending_deletion_error_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# aws-config-change
variable "aws_config_change_enabled" {
  description = "Enable aws-config-change alarm"
  default     = true
  type        = bool
}

variable "aws_config_change_pattern" {
  description = "Pattern used on filter"
  default     = "{ $.eventSource = config.amazonaws.com && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel) ||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }"
  type        = string
}

variable "aws_config_change_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "aws_config_change_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "aws_config_change_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# route-table-changes
variable "route_table_changes_enabled" {
  description = "Enable route-table-changes alarm"
  default     = true
  type        = bool
}

variable "route_table_changes_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
  type        = string
}

variable "route_table_changes_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "route_table_changes_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "route_table_changes_priority" {
  description = "Priority of alarm"
  default     = "P5"
  type        = string
}

# backup-plan-job-failed
variable "backup_plan_job_failed_enabled" {
  description = "Enable backup-plan-job-failed alarm"
  default     = true
  type        = bool
}

variable "backup_plan_job_failed_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventSource = backup.amazonaws.com) && ($.eventName = BackupJobCompleted) && ($.errorCode = FAILED) }"
  type        = string
}

variable "backup_plan_job_failed_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "backup_plan_job_failed_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "backup_plan_job_failed_priority" {
  description = "Priority of alarm"
  default     = "P3"
  type        = string
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "aws_organizations_changes_enabled" {
  description = "Enable organizations changes alarm"
  default     = true
  type        = bool
}

variable "aws_organizations_changes_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventSource = organizations.amazonaws.com) && ($.eventName = AcceptHandshake) || ($.eventName = AttachPolicy) || ($.eventName = CancelHandshake) || ($.eventName = CreateAccount) || ($.eventName = CreateOrganization) || ($.eventName = CreateOrganizationalUnit) || ($.eventName = CreatePolicy) || ($.eventName = DeclineHandshake) || ($.eventName = DeleteOrganization) || ($.eventName = DeleteOrganizationalUnit) || ($.eventName = DeletePolicy) || ($.eventName = EnableAllFeatures) || ($.eventName = EnablePolicyType) || ($.eventName = InviteAccountToOrganization) || ($.eventName = LeaveOrganization) || ($.eventName = DetachPolicy) || ($.eventName = DisablePolicyType) || ($.eventName = MoveAccount) || ($.eventName = RemoveAccountFromOrganization) || ($.eventName = UpdateOrganizationalUnit) || ($.eventName = UpdatePolicy) }"
  type        = string
}

variable "aws_organizations_changes_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "aws_organizations_changes_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "aws_organizations_changes_priority" {
  description = "Priority of alarm"
  default     = "P2"
  type        = string
}

variable "disable_or_scheduled_deletion_of_kms_cmk_enabled" {
  description = "Enable organizations changes alarm"
  default     = true
  type        = bool
}

variable "disable_or_scheduled_deletion_of_kms_cmk_pattern" {
  description = "Pattern used on filter"
  default     = "{ ($.eventSource = kms.amazonaws.com) && (($.eventName = DisableKey) || ($.eventName = ScheduleKeyDeletion)) }"
  type        = string
}

variable "disable_or_scheduled_deletion_of_kms_cmk_period" {
  description = "Period used on filter"
  default     = 300
  type        = number
}

variable "disable_or_scheduled_deletion_of_kms_cmk_threshold" {
  description = "Threshold used on filter"
  default     = 1
  type        = number
}

variable "disable_or_scheduled_deletion_of_kms_cmk_priority" {
  description = "Priority of alarm"
  default     = "P2"
  type        = string
}
