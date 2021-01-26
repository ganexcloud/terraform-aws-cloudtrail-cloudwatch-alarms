data "aws_caller_identity" "default" {}

data "aws_region" "current" {}

data "aws_iam_account_alias" "current" {}

resource "aws_cloudwatch_log_metric_filter" "api_authorization_failure" {
  count          = var.api-authorization-failure ? 1 : 0
  name           = "api-authorization-failure"
  pattern        = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
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
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = 1
  alarm_description   = "Alarms when an unauthorized API call is made."
  alarm_actions       = var.sns_topic_arn
  ok_actions          = var.sns_topic_arn
}
