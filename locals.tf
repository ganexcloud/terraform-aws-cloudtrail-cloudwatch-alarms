locals {
  metric_alarm_name_prefix = var.metric_alarm_name_prefix == "" ? data.aws_iam_account_alias.current.account_alias : var.metric_alarm_name_prefix
}
