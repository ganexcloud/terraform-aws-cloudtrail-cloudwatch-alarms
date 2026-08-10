provider "aws" {
  region = "us-east-1"
}

module "cloudtrail_cloudwatch_alarms" {
  source = "../.."

  log_group_name = "/aws/cloudtrail/example"
  sns_topic_arn  = ["arn:aws:sns:us-east-1:000000000000:cloudtrail-example"]
}
