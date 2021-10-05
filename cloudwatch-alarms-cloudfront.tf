variable "default_threshold" {
  description = "The default threshold for the metric."
  default     = 5
}

variable "default_evaluation_periods" {
  description = "The default amount of evaluation periods."
  default     = 2
}

variable "default_period" {
  description = "The default evaluation period."
  default     = 60
}

variable "default_comparison_operator" {
  description = "The default comparison operator."
  default     = "GreaterThanOrEqualToThreshold"
}

variable "default_statistic" {
  description = "The default statistic."
  default     = "Average"
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  count = length(var.alarms)

  alarm_name = format("cloudfront-%s-%s",
    aws_cloudfront_distribution.default[0].id,
    element(keys(var.alarms), count.index)
  )

  comparison_operator = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "comparison_operator",
    var.default_comparison_operator
  )

  evaluation_periods = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "evaluation_periods",
    var.default_evaluation_periods
  )

  metric_name = element(keys(var.alarms), count.index)

  namespace = "AWS/CloudFront"

  period = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "period",
    var.default_period
  )

  statistic = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "statistic",
    var.default_statistic
  )

  threshold = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "threshold",
    var.default_threshold
  )

  dimensions = {
    DistributionId = aws_cloudfront_distribution.default[0].id
    Region         = "Global"
  }

  alarm_actions = compact(split(",", lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "actions",
    ""
  )))

  ok_actions = compact(split(",", lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "ok_actions",
    ""
  )))

  insufficient_data_actions = []
  treat_missing_data        = "ignore"
}