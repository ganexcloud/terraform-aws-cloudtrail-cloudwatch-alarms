# terraform-aws-cloudtrail-cloudwatch-alarms

Terraform module that provisions CloudWatch metric filters and alarms for
CloudTrail events.

## Compatibility

This module requires Terraform 1.6.0 or later and supports AWS provider
versions from 5.40.0 up to, but not including, 7.0.0.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.40.0, < 7.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.40.0, < 7.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_metric_filter.api_authorization_failure](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.aws_config_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.aws_organizations_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.backup_plan_job_failed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.cloudtrail_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.console_sign_in_failure](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.console_sign_in_without_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.disable_or_scheduled_deletion_of_kms_cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.ec2_instance_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.ec2_large_instance_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.gateway_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.iam_policy_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.kms-key-pending-deletion-error](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.network_acl_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.root_account_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.route_table_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.s3_bucket_activity_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.security_group_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.vpc_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.api_authorization_failure](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.aws_config_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.aws_organizations_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.backup_plan_job_failed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cloudtrail_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.console_sign_in_failure](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.console_sign_in_without_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.disable_or_scheduled_deletion_of_kms_cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.ec2_instance_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.ec2_large_instance_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.gateway_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.iam_policy_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.kms-key-pending-deletion-error](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.network_acl_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.root_account_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.route_table_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.s3_bucket_activity_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.security_group_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.vpc_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_account_alias.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_account_alias) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_endpoint_arns"></a> [additional\_endpoint\_arns](#input\_additional\_endpoint\_arns) | Any alert endpoints, such as autoscaling, or app scaling endpoint arns that will respond to an alert | `list(string)` | `[]` | no |
| <a name="input_api_authorization_failure_enabled"></a> [api\_authorization\_failure\_enabled](#input\_api\_authorization\_failure\_enabled) | Enable api-authorization-failure alarm | `bool` | `true` | no |
| <a name="input_api_authorization_failure_pattern"></a> [api\_authorization\_failure\_pattern](#input\_api\_authorization\_failure\_pattern) | Pattern used on filter | `string` | `"{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"` | no |
| <a name="input_api_authorization_failure_period"></a> [api\_authorization\_failure\_period](#input\_api\_authorization\_failure\_period) | Pattern used on filter | `number` | `300` | no |
| <a name="input_api_authorization_failure_priority"></a> [api\_authorization\_failure\_priority](#input\_api\_authorization\_failure\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_api_authorization_failure_threshold"></a> [api\_authorization\_failure\_threshold](#input\_api\_authorization\_failure\_threshold) | Pattern used on filter | `number` | `10` | no |
| <a name="input_aws_config_change_enabled"></a> [aws\_config\_change\_enabled](#input\_aws\_config\_change\_enabled) | Enable aws-config-change alarm | `bool` | `true` | no |
| <a name="input_aws_config_change_pattern"></a> [aws\_config\_change\_pattern](#input\_aws\_config\_change\_pattern) | Pattern used on filter | `string` | `"{ $.eventSource = config.amazonaws.com && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel) ||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }"` | no |
| <a name="input_aws_config_change_period"></a> [aws\_config\_change\_period](#input\_aws\_config\_change\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_aws_config_change_priority"></a> [aws\_config\_change\_priority](#input\_aws\_config\_change\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_aws_config_change_threshold"></a> [aws\_config\_change\_threshold](#input\_aws\_config\_change\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_aws_organizations_changes_enabled"></a> [aws\_organizations\_changes\_enabled](#input\_aws\_organizations\_changes\_enabled) | Enable organizations changes alarm | `bool` | `true` | no |
| <a name="input_aws_organizations_changes_pattern"></a> [aws\_organizations\_changes\_pattern](#input\_aws\_organizations\_changes\_pattern) | Pattern used on filter | `string` | `"{ ($.eventSource = organizations.amazonaws.com) && (($.eventName = AcceptHandshake) || ($.eventName = AttachPolicy) || ($.eventName = CancelHandshake) || ($.eventName = CreateAccount) || ($.eventName = CreateOrganization) || ($.eventName = CreateOrganizationalUnit) || ($.eventName = CreatePolicy) || ($.eventName = DeclineHandshake) || ($.eventName = DeleteOrganization) || ($.eventName = DeleteOrganizationalUnit) || ($.eventName = DeletePolicy) || ($.eventName = EnableAllFeatures) || ($.eventName = EnablePolicyType) || ($.eventName = InviteAccountToOrganization) || ($.eventName = LeaveOrganization) || ($.eventName = DetachPolicy) || ($.eventName = DisablePolicyType) || ($.eventName = MoveAccount) || ($.eventName = RemoveAccountFromOrganization) || ($.eventName = UpdateOrganizationalUnit) || ($.eventName = UpdatePolicy)) }"` | no |
| <a name="input_aws_organizations_changes_period"></a> [aws\_organizations\_changes\_period](#input\_aws\_organizations\_changes\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_aws_organizations_changes_priority"></a> [aws\_organizations\_changes\_priority](#input\_aws\_organizations\_changes\_priority) | Priority of alarm | `string` | `"P2"` | no |
| <a name="input_aws_organizations_changes_threshold"></a> [aws\_organizations\_changes\_threshold](#input\_aws\_organizations\_changes\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_backup_plan_job_failed_enabled"></a> [backup\_plan\_job\_failed\_enabled](#input\_backup\_plan\_job\_failed\_enabled) | Enable backup-plan-job-failed alarm | `bool` | `true` | no |
| <a name="input_backup_plan_job_failed_pattern"></a> [backup\_plan\_job\_failed\_pattern](#input\_backup\_plan\_job\_failed\_pattern) | Pattern used on filter | `string` | `"{ ($.eventSource = backup.amazonaws.com) && ($.eventName = BackupJobCompleted) && ($.errorCode = FAILED) }"` | no |
| <a name="input_backup_plan_job_failed_period"></a> [backup\_plan\_job\_failed\_period](#input\_backup\_plan\_job\_failed\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_backup_plan_job_failed_priority"></a> [backup\_plan\_job\_failed\_priority](#input\_backup\_plan\_job\_failed\_priority) | Priority of alarm | `string` | `"P3"` | no |
| <a name="input_backup_plan_job_failed_threshold"></a> [backup\_plan\_job\_failed\_threshold](#input\_backup\_plan\_job\_failed\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_cloudtrail_event_enabled"></a> [cloudtrail\_event\_enabled](#input\_cloudtrail\_event\_enabled) | Enable cloudtrail-event alarm | `bool` | `true` | no |
| <a name="input_cloudtrail_event_pattern"></a> [cloudtrail\_event\_pattern](#input\_cloudtrail\_event\_pattern) | Pattern used on filter | `string` | `"{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"` | no |
| <a name="input_cloudtrail_event_period"></a> [cloudtrail\_event\_period](#input\_cloudtrail\_event\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_cloudtrail_event_priority"></a> [cloudtrail\_event\_priority](#input\_cloudtrail\_event\_priority) | Priority of alarm | `string` | `"P4"` | no |
| <a name="input_cloudtrail_event_threshold"></a> [cloudtrail\_event\_threshold](#input\_cloudtrail\_event\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_console_sign_in_failure_enabled"></a> [console\_sign\_in\_failure\_enabled](#input\_console\_sign\_in\_failure\_enabled) | Enable console-sign-in-failure alarm | `bool` | `true` | no |
| <a name="input_console_sign_in_failure_pattern"></a> [console\_sign\_in\_failure\_pattern](#input\_console\_sign\_in\_failure\_pattern) | Pattern used on filter | `string` | `"{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"` | no |
| <a name="input_console_sign_in_failure_period"></a> [console\_sign\_in\_failure\_period](#input\_console\_sign\_in\_failure\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_console_sign_in_failure_priority"></a> [console\_sign\_in\_failure\_priority](#input\_console\_sign\_in\_failure\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_console_sign_in_failure_threshold"></a> [console\_sign\_in\_failure\_threshold](#input\_console\_sign\_in\_failure\_threshold) | Threshold used on filter | `number` | `3` | no |
| <a name="input_console_sign_in_without_mfa_enabled"></a> [console\_sign\_in\_without\_mfa\_enabled](#input\_console\_sign\_in\_without\_mfa\_enabled) | Enable console-sign-in-without-mfa alarm | `bool` | `false` | no |
| <a name="input_console_sign_in_without_mfa_pattern"></a> [console\_sign\_in\_without\_mfa\_pattern](#input\_console\_sign\_in\_without\_mfa\_pattern) | Pattern used on filter | `string` | `"{ $.eventName = \"ConsoleLogin\" && $.additionalEventData.MFAUsed = \"No\" }"` | no |
| <a name="input_console_sign_in_without_mfa_period"></a> [console\_sign\_in\_without\_mfa\_period](#input\_console\_sign\_in\_without\_mfa\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_console_sign_in_without_mfa_priority"></a> [console\_sign\_in\_without\_mfa\_priority](#input\_console\_sign\_in\_without\_mfa\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_console_sign_in_without_mfa_threshold"></a> [console\_sign\_in\_without\_mfa\_threshold](#input\_console\_sign\_in\_without\_mfa\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_disable_or_scheduled_deletion_of_kms_cmk_enabled"></a> [disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_enabled](#input\_disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_enabled) | Enable disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_enabled alarm | `bool` | `true` | no |
| <a name="input_disable_or_scheduled_deletion_of_kms_cmk_pattern"></a> [disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_pattern](#input\_disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_pattern) | Pattern used on filter | `string` | `"{ ($.eventSource = kms.amazonaws.com) && (($.eventName = DisableKey) || ($.eventName = ScheduleKeyDeletion)) }"` | no |
| <a name="input_disable_or_scheduled_deletion_of_kms_cmk_period"></a> [disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_period](#input\_disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_disable_or_scheduled_deletion_of_kms_cmk_priority"></a> [disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_priority](#input\_disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_priority) | Priority of alarm | `string` | `"P2"` | no |
| <a name="input_disable_or_scheduled_deletion_of_kms_cmk_threshold"></a> [disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_threshold](#input\_disable\_or\_scheduled\_deletion\_of\_kms\_cmk\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_ec2_instance_event_enabled"></a> [ec2\_instance\_event\_enabled](#input\_ec2\_instance\_event\_enabled) | Enable ec2-instance-event alarm | `bool` | `true` | no |
| <a name="input_ec2_instance_event_pattern"></a> [ec2\_instance\_event\_pattern](#input\_ec2\_instance\_event\_pattern) | Pattern used on filter | `string` | `"{ (($.userIdentity.invokedBy != \"autoscaling.amazonaws.com\" && $.userIdentity.invokedBy != \"spot.amazonaws.com\") || $.userIdentity.invokedBy NOT EXISTS ) && ($.eventName = RunInstances || $.eventName = RebootInstances || $.eventName = StartInstances || $.eventName = StopInstances || $.eventName = TerminateInstances) && $.userIdentity.arn != \"*karpenter*\"}"` | no |
| <a name="input_ec2_instance_event_period"></a> [ec2\_instance\_event\_period](#input\_ec2\_instance\_event\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_ec2_instance_event_priority"></a> [ec2\_instance\_event\_priority](#input\_ec2\_instance\_event\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_ec2_instance_event_threshold"></a> [ec2\_instance\_event\_threshold](#input\_ec2\_instance\_event\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_ec2_large_instance_event_enabled"></a> [ec2\_large\_instance\_event\_enabled](#input\_ec2\_large\_instance\_event\_enabled) | Enable ec2-large-instance-event alarm | `bool` | `true` | no |
| <a name="input_ec2_large_instance_event_pattern"></a> [ec2\_large\_instance\_event\_pattern](#input\_ec2\_large\_instance\_event\_pattern) | Pattern used on filter | `string` | `"{ ($.eventName = RunInstances) && (($.requestParameters.instanceType = *.2xlarge) || ($.requestParameters.instanceType = *.4xlarge) || ($.requestParameters.instanceType = *.8xlarge) || ($.requestParameters.instanceType = *.10xlarge) || ($.requestParameters.instanceType = *.12xlarge) || ($.requestParameters.instanceType = *.16xlarge) || ($.requestParameters.instanceType = *.24xlarge) || ($.requestParameters.instanceType = *.32xlarge) || ($.requestParameters.instanceType = *.metal)) && ($.errorCode != Client.DryRunOperation) && ($.errorCode != Client.RequestLimitExceeded) }"` | no |
| <a name="input_ec2_large_instance_event_period"></a> [ec2\_large\_instance\_event\_period](#input\_ec2\_large\_instance\_event\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_ec2_large_instance_event_priority"></a> [ec2\_large\_instance\_event\_priority](#input\_ec2\_large\_instance\_event\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_ec2_large_instance_event_threshold"></a> [ec2\_large\_instance\_event\_threshold](#input\_ec2\_large\_instance\_event\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_gateway_event_enabled"></a> [gateway\_event\_enabled](#input\_gateway\_event\_enabled) | Enable gateway-event alarm | `bool` | `true` | no |
| <a name="input_gateway_event_pattern"></a> [gateway\_event\_pattern](#input\_gateway\_event\_pattern) | Pattern used on filter | `string` | `"{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"` | no |
| <a name="input_gateway_event_period"></a> [gateway\_event\_period](#input\_gateway\_event\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_gateway_event_priority"></a> [gateway\_event\_priority](#input\_gateway\_event\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_gateway_event_threshold"></a> [gateway\_event\_threshold](#input\_gateway\_event\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_iam_policy_change_enabled"></a> [iam\_policy\_change\_enabled](#input\_iam\_policy\_change\_enabled) | Enable iam-policy-change alarm | `bool` | `true` | no |
| <a name="input_iam_policy_change_pattern"></a> [iam\_policy\_change\_pattern](#input\_iam\_policy\_change\_pattern) | Pattern used on filter | `string` | `"{ ($.eventName = DeleteGroupPolicy) || ($.eventName = DeleteRolePolicy) ||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"` | no |
| <a name="input_iam_policy_change_period"></a> [iam\_policy\_change\_period](#input\_iam\_policy\_change\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_iam_policy_change_priority"></a> [iam\_policy\_change\_priority](#input\_iam\_policy\_change\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_iam_policy_change_threshold"></a> [iam\_policy\_change\_threshold](#input\_iam\_policy\_change\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_kms_key_pending_deletion_error_enabled"></a> [kms\_key\_pending\_deletion\_error\_enabled](#input\_kms\_key\_pending\_deletion\_error\_enabled) | Enable kms-key-pending-deletion-error alarm | `bool` | `true` | no |
| <a name="input_kms_key_pending_deletion_error_pattern"></a> [kms\_key\_pending\_deletion\_error\_pattern](#input\_kms\_key\_pending\_deletion\_error\_pattern) | Pattern used on filter | `string` | `"{ $.eventSource = kms* && $.errorMessage = \"* is pending deletion.\"}"` | no |
| <a name="input_kms_key_pending_deletion_error_period"></a> [kms\_key\_pending\_deletion\_error\_period](#input\_kms\_key\_pending\_deletion\_error\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_kms_key_pending_deletion_error_priority"></a> [kms\_key\_pending\_deletion\_error\_priority](#input\_kms\_key\_pending\_deletion\_error\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_kms_key_pending_deletion_error_threshold"></a> [kms\_key\_pending\_deletion\_error\_threshold](#input\_kms\_key\_pending\_deletion\_error\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | The cloudtrail cloudwatch log group name | `string` | n/a | yes |
| <a name="input_metric_alarm_name_prefix"></a> [metric\_alarm\_name\_prefix](#input\_metric\_alarm\_name\_prefix) | Prefix to add in all alarms. Current account alias if used if none provied. | `string` | `""` | no |
| <a name="input_metric_namespace"></a> [metric\_namespace](#input\_metric\_namespace) | A namespace for grouping all of the metrics together | `string` | `"CloudTrailAlarms"` | no |
| <a name="input_network_acl_event_enabled"></a> [network\_acl\_event\_enabled](#input\_network\_acl\_event\_enabled) | Enable network-acl-event alarm | `bool` | `true` | no |
| <a name="input_network_acl_event_pattern"></a> [network\_acl\_event\_pattern](#input\_network\_acl\_event\_pattern) | Pattern used on filter | `string` | `"{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"` | no |
| <a name="input_network_acl_event_period"></a> [network\_acl\_event\_period](#input\_network\_acl\_event\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_network_acl_event_priority"></a> [network\_acl\_event\_priority](#input\_network\_acl\_event\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_network_acl_event_threshold"></a> [network\_acl\_event\_threshold](#input\_network\_acl\_event\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | The region that should be monitored for unauthorised AWS API Access. Current region used if none provied. | `string` | `""` | no |
| <a name="input_root_account_usage_enabled"></a> [root\_account\_usage\_enabled](#input\_root\_account\_usage\_enabled) | Enable root-account-usage alarm | `bool` | `true` | no |
| <a name="input_root_account_usage_pattern"></a> [root\_account\_usage\_pattern](#input\_root\_account\_usage\_pattern) | Pattern used on filter | `string` | `"{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"` | no |
| <a name="input_root_account_usage_period"></a> [root\_account\_usage\_period](#input\_root\_account\_usage\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_root_account_usage_priority"></a> [root\_account\_usage\_priority](#input\_root\_account\_usage\_priority) | Priority of alarm | `string` | `"P2"` | no |
| <a name="input_root_account_usage_threshold"></a> [root\_account\_usage\_threshold](#input\_root\_account\_usage\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_route_table_changes_enabled"></a> [route\_table\_changes\_enabled](#input\_route\_table\_changes\_enabled) | Enable route-table-changes alarm | `bool` | `true` | no |
| <a name="input_route_table_changes_pattern"></a> [route\_table\_changes\_pattern](#input\_route\_table\_changes\_pattern) | Pattern used on filter | `string` | `"{($.eventSource = ec2.amazonaws.com) && (($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable)) }"` | no |
| <a name="input_route_table_changes_period"></a> [route\_table\_changes\_period](#input\_route\_table\_changes\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_route_table_changes_priority"></a> [route\_table\_changes\_priority](#input\_route\_table\_changes\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_route_table_changes_threshold"></a> [route\_table\_changes\_threshold](#input\_route\_table\_changes\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_s3_bucket_activity_event_enabled"></a> [s3\_bucket\_activity\_event\_enabled](#input\_s3\_bucket\_activity\_event\_enabled) | Enable s3-bucket-activity-event alarm | `bool` | `true` | no |
| <a name="input_s3_bucket_activity_event_pattern"></a> [s3\_bucket\_activity\_event\_pattern](#input\_s3\_bucket\_activity\_event\_pattern) | Pattern used on filter | `string` | `"{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"` | no |
| <a name="input_s3_bucket_activity_event_period"></a> [s3\_bucket\_activity\_event\_period](#input\_s3\_bucket\_activity\_event\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_s3_bucket_activity_event_priority"></a> [s3\_bucket\_activity\_event\_priority](#input\_s3\_bucket\_activity\_event\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_s3_bucket_activity_event_threshold"></a> [s3\_bucket\_activity\_event\_threshold](#input\_s3\_bucket\_activity\_event\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_security_group_event_enabled"></a> [security\_group\_event\_enabled](#input\_security\_group\_event\_enabled) | Enable security-group-event alarm | `bool` | `true` | no |
| <a name="input_security_group_event_pattern"></a> [security\_group\_event\_pattern](#input\_security\_group\_event\_pattern) | Pattern used on filter | `string` | `"{ (($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup)) && $.userIdentity.arn != \"*aws-load-balancer-controller*\" }"` | no |
| <a name="input_security_group_event_period"></a> [security\_group\_event\_period](#input\_security\_group\_event\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_security_group_event_priority"></a> [security\_group\_event\_priority](#input\_security\_group\_event\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_security_group_event_threshold"></a> [security\_group\_event\_threshold](#input\_security\_group\_event\_threshold) | Threshold used on filter | `number` | `1` | no |
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | A list of ARNs (i.e. SNS Topic ARN) to notify on alerts | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags (key-value pairs) passed to resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_event_enabled"></a> [vpc\_event\_enabled](#input\_vpc\_event\_enabled) | Enable vpc-event alarm | `bool` | `true` | no |
| <a name="input_vpc_event_pattern"></a> [vpc\_event\_pattern](#input\_vpc\_event\_pattern) | Pattern used on filter | `string` | `"{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"` | no |
| <a name="input_vpc_event_period"></a> [vpc\_event\_period](#input\_vpc\_event\_period) | Period used on filter | `number` | `300` | no |
| <a name="input_vpc_event_priority"></a> [vpc\_event\_priority](#input\_vpc\_event\_priority) | Priority of alarm | `string` | `"P5"` | no |
| <a name="input_vpc_event_threshold"></a> [vpc\_event\_threshold](#input\_vpc\_event\_threshold) | Threshold used on filter | `number` | `1` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Example

See [`examples/complete`](examples/complete).
