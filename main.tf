data "aws_caller_identity" "default" {
}

data "aws_region" "current" {
}

data "aws_iam_account_alias" "current" {
}

resource "aws_cloudwatch_log_metric_filter" "default" {
  count          = length(local.filter_pattern)
  name           = local.metric_name[count.index]
  pattern        = local.filter_pattern[count.index]
  log_group_name = var.log_group_name

  metric_transformation {
    name      = local.metric_name[count.index]
    namespace = local.metric_namespace
    value     = local.metric_value
  }
}

resource "aws_cloudwatch_metric_alarm" "default" {
  count               = length(local.filter_pattern)
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] ${local.metric_name[count.index]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = local.metric_name[count.index]
  namespace           = local.metric_namespace
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = local.metric_name[count.index] == "ConsoleSignInFailureCount" ? "3" : "1"
  alarm_description   = local.alarm_description[count.index]
  alarm_actions       = var.sns_topic_arn
}
