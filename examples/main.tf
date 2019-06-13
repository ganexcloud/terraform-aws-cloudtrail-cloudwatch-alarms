module "cloudtrail_alarms-ENVIRONMENT" {
  source         = "git::https://gitlab.com/ganex-cloud/terraform/terraform-aws-cloudtrail-alarms.git?ref=master"
  region         = "us-east-1"
  log_group_name = "${module.cloudtrail.cloudwatch_log_group_name}"
}
