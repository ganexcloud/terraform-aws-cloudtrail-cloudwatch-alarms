data "aws_caller_identity" "default" {}
data "aws_region" "current" {}
data "aws_iam_account_alias" "current" {}

resource "aws_sns_topic" "default" {
  name = "${local.alert_for}"
}

resource "aws_sns_topic_policy" "default" {
  count  = "${var.add_sns_policy != "true" && var.sns_topic_arn != "" ? 0 : 1}"
  arn    = "${local.sns_topic_arn}"
  policy = "${data.aws_iam_policy_document.sns_topic_policy.json}"
}

data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"

  statement {
    sid = "__default_statement_ID"

    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    effect    = "Allow"
    resources = ["${local.sns_topic_arn}"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "arn:aws:iam::${data.aws_caller_identity.default.account_id}:root",
      ]
    }
  }

  statement {
    sid       = "Allow ${local.alert_for} CloudwatchEvents"
    effect    = "Allow"
    actions   = ["sns:Publish"]
    resources = ["${local.sns_topic_arn}"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "ArnLike"
      variable = "AWS:SourceArn"

      values = [
        "arn:aws:cloudwatch::${data.aws_caller_identity.default.account_id}:alarm:[${title(local.metric_alarm_name_prefix)}]*",
      ]
    }
  }
}

resource "aws_cloudwatch_log_metric_filter" "default" {
  count          = "${length(local.filter_pattern)}"
  name           = "${local.metric_name[count.index]}"
  pattern        = "${local.filter_pattern[count.index]}"
  log_group_name = "${var.log_group_name}"

  metric_transformation {
    name      = "${local.metric_name[count.index]}"
    namespace = "${local.metric_namespace}"
    value     = "${local.metric_value}"
  }
}

resource "aws_cloudwatch_metric_alarm" "default" {
  count               = "${length(local.filter_pattern)}"
  alarm_name          = "[${title(local.metric_alarm_name_prefix)}] ${local.metric_name[count.index]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "${local.metric_name[count.index]}"
  namespace           = "${local.metric_namespace}"
  period              = "300"
  statistic           = "Sum"
  treat_missing_data  = "notBreaching"
  threshold           = "${local.metric_name[count.index] == "ConsoleSignInFailureCount" ? "3" :"1"}"
  alarm_description   = "${local.alarm_description[count.index]}"
  alarm_actions       = ["${local.endpoints}"]
}
