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

variable "s3-bucket-activity-event" {
  description = "Enable s3-bucket-activity-event alarm"
  default     = true
  type        = bool
}

variable "security-group-event" {
  description = "Enable security-group-event alarm"
  default     = true
  type        = bool
}

variable "network-acl-event" {
  description = "Enable network-acl-event alarm"
  default     = true
  type        = bool
}

variable "gateway-event" {
  description = "Enable gateway-event alarm"
  default     = true
  type        = bool
}

variable "vpc-event" {
  description = "Enable vpc-event alarm"
  default     = true
  type        = bool
}

variable "ec2-instance-event" {
  description = "Enable ec2-instance-event alarm"
  default     = true
  type        = bool
}

variable "ec2-large-instance-event" {
  description = "Enable ec2-large-instance-event alarm"
  default     = true
  type        = bool
}

variable "cloudtrail-event" {
  description = "Enable cloudtrail-event alarm"
  default     = true
  type        = bool
}

variable "console-sign-in-failure" {
  description = "Enable console-sign-in-failure alarm"
  default     = true
  type        = bool
}

variable "iam-policy-change" {
  description = "Enable iam-policy-change alarm"
  default     = true
  type        = bool
}

variable "console-sign-in-without-mfa" {
  description = "Enable console-sign-in-without-mfa alarm"
  default     = true
  type        = bool
}

variable "root-account-usage" {
  description = "Enable root-account-usage alarm"
  default     = true
  type        = bool
}

variable "kms-key-pending-deletion-error" {
  description = "Enable kms-key-pending-deletion-error alarm"
  default     = true
  type        = bool
}

variable "aws-config-change" {
  description = "Enable aws-config-change alarm"
  default     = true
  type        = bool
}

variable "route-table-changes" {
  description = "Enable route-table-changes alarm"
  default     = true
  type        = bool
}

variable "backup-plan-job-failed" {
  description = "Enable backup-plan-job-failed alarm"
  default     = true
  type        = bool
}
