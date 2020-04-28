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
