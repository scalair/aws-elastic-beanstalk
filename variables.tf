variable "tags" {
  description = "A map of tags to add to all resources."
  type        = "map"
  default     = {}
}

variable "vpc_id" {
  description = "ID of the VPC in which to provision the AWS resources"
}

#################################
# Elastic Beanstalk Application #
#################################
variable "elastic_beanstalk_application_name" {
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
}

variable "elastic_beanstalk_application_namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "elastic_beanstalk_application_stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

#################################
# Elastic Beanstalk Environment #
#################################
variable "elastic_beanstalk_environment_namespace" {
  type        = "string"
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
}

variable "elastic_beanstalk_environment_stage" {
  type        = "string"
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
}

variable "elastic_beanstalk_environment_delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "elastic_beanstalk_environment_attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "elastic_beanstalk_environment_name" {
  default     = "app"
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "elastic_beanstalk_environment_description" {
  default     = ""
  description = "Short description of the Environment"
}

variable "elastic_beanstalk_environment_config_document" {
  default     = "{ \"CloudWatchMetrics\": {}, \"Version\": 1}"
  description = "A JSON document describing the environment and instance metrics to publish to CloudWatch."
}

variable "elastic_beanstalk_environment_enhanced_reporting_enabled" {
  default     = true
  description = "Whether to enable \"enhanced\" health reporting for this environment.  If false, \"basic\" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false"
}

variable "elastic_beanstalk_environment_health_streaming_enabled" {
  default     = false
  description = "For environments with enhanced health reporting enabled, whether to create a group in CloudWatch Logs for environment health and archive Elastic Beanstalk environment health data. For information about enabling enhanced health, see aws:elasticbeanstalk:healthreporting:system."
}

variable "elastic_beanstalk_environment_health_streaming_delete_on_terminate" {
  default     = false
  description = "Whether to delete the log group when the environment is terminated. If false, the health data is kept RetentionInDays days."
}

variable "elastic_beanstalk_environment_health_streaming_retention_in_days" {
  default     = "7"
  description = "The number of days to keep the archived health data before it expires."
}

variable "elastic_beanstalk_environment_healthcheck_url" {
  default     = "/healthcheck"
  description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
}

variable "elastic_beanstalk_environment_notification_protocol" {
  default     = "email"
  description = "Notification protocol"
}

variable "elastic_beanstalk_environment_notification_endpoint" {
  default     = ""
  description = "Notification endpoint"
}

variable "elastic_beanstalk_environment_notification_topic_arn" {
  default     = ""
  description = "Notification topic arn"
}

variable "elastic_beanstalk_environment_notification_topic_name" {
  default     = ""
  description = "Notification topic name"
}

variable "elastic_beanstalk_environment_enable_log_publication_control" {
  default     = false
  description = "Copy the log files for your application's Amazon EC2 instances to the Amazon S3 bucket associated with your application."
}

variable "elastic_beanstalk_environment_enable_stream_logs" {
  default     = false
  description = "Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment."
}

variable "elastic_beanstalk_environment_logs_delete_on_terminate" {
  default     = false
  description = "Whether to delete the log groups when the environment is terminated. If false, the logs are kept RetentionInDays days."
}

variable "elastic_beanstalk_environment_logs_retention_in_days" {
  default     = "7"
  description = "The number of days to keep log events before they expire."
}

variable "elastic_beanstalk_environment_environment_type" {
  default     = "LoadBalanced"
  description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `public_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments)"
}

variable "elastic_beanstalk_environment_loadbalancer_type" {
  default     = "classic"
  description = "Load Balancer type, e.g. 'application' or 'classic'"
}

variable "elastic_beanstalk_environment_loadbalancer_certificate_arn" {
  default     = ""
  description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
}

variable "elastic_beanstalk_environment_loadbalancer_ssl_policy" {
  default     = ""
  description = "Specify a security policy to apply to the listener. This option is only applicable to environments with an application load balancer."
}

variable "elastic_beanstalk_environment_loadbalancer_managed_security_group" {
  type        = "string"
  default     = ""
  description = "Load balancer managed security group"
}

variable "elastic_beanstalk_environment_http_listener_enabled" {
  default     = "false"
  description = "Enable port 80 (http)"
}

variable "elastic_beanstalk_environment_application_port" {
  default     = "80"
  description = "Port application is listening on"
}

variable "elastic_beanstalk_environment_stickiness_enabled" {
  default     = "false"
  description = "Set to true to enable sticky sessions"
}

variable "elastic_beanstalk_environment_stickiness_lb_cookie_duration" {
  default     = "86400"
  description = "Lifetime, in seconds, of the sticky session cookie"
}

variable "elastic_beanstalk_environment_ssh_listener_enabled" {
  default     = "false"
  description = "Enable ssh port"
}

variable "elastic_beanstalk_environment_ssh_listener_port" {
  default     = "22"
  description = "SSH port"
}

variable "elastic_beanstalk_environment_zone_id" {
  default     = ""
  description = "Route53 parent zone ID. The module will create sub-domain DNS records in the parent zone for the EB environment"
}

variable "elastic_beanstalk_environment_config_source" {
  default     = ""
  description = "S3 source for config"
}

variable "elastic_beanstalk_environment_enable_managed_actions" {
  default     = true
  description = "Enable managed platform updates. When you set this to true, you must also specify a `PreferredStartTime` and `UpdateLevel`"
}

variable "elastic_beanstalk_environment_preferred_start_time" {
  default     = "Sun:10:00"
  description = "Configure a maintenance window for managed actions in UTC"
}

variable "elastic_beanstalk_environment_update_level" {
  default     = "minor"
  description = "The highest level of update to apply with managed platform updates"
}

variable "elastic_beanstalk_environment_instance_refresh_enabled" {
  default     = "true"
  description = "Enable weekly instance replacement."
}

variable "elastic_beanstalk_environment_public_subnets" {
  type        = "list"
  description = "List of public subnets to place Elastic Load Balancer"
}

variable "elastic_beanstalk_environment_private_subnets" {
  type        = "list"
  description = "List of private subnets to place EC2 instances"
}

variable "elastic_beanstalk_environment_keypair" {
  description = "Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS"
}

variable "elastic_beanstalk_environment_root_volume_size" {
  default     = "8"
  description = "The size of the EBS root volume"
}

variable "elastic_beanstalk_environment_root_volume_type" {
  default     = "gp2"
  description = "The type of the EBS root volume"
}

variable "elastic_beanstalk_environment_availability_zones" {
  default     = "Any 2"
  description = "Choose the number of AZs for your instances"
}

variable "elastic_beanstalk_environment_rolling_update_type" {
  default     = "Health"
  description = "Set it to Immutable to apply the configuration change to a fresh group of instances"
}

variable "elastic_beanstalk_environment_updating_min_in_service" {
  default     = "1"
  description = "Minimum count of instances up during update"
}

variable "elastic_beanstalk_environment_updating_max_batch" {
  default     = "1"
  description = "Maximum count of instances up during update"
}

variable "elastic_beanstalk_environment_ssh_source_restriction" {
  default     = "0.0.0.0/0"
  description = "Used to lock down SSH access to the EC2 instances."
}

variable "elastic_beanstalk_environment_instance_type" {
  default     = "t2.micro"
  description = "Instances type"
}

variable "elastic_beanstalk_environment_associate_public_ip_address" {
  default     = "false"
  description = "Specifies whether to launch instances in your VPC with public IP addresses."
}

variable "elastic_beanstalk_environment_autoscale_measure_name" {
  default     = "CPUUtilization"
  description = "Metric used for your Auto Scaling trigger"
}

variable "elastic_beanstalk_environment_autoscale_statistic" {
  default     = "Average"
  description = "Statistic the trigger should use, such as Average"
}

variable "elastic_beanstalk_environment_autoscale_unit" {
  default     = "Percent"
  description = "Unit for the trigger measurement, such as Bytes"
}

variable "elastic_beanstalk_environment_autoscale_lower_bound" {
  default     = "20"
  description = "Minimum level of autoscale metric to remove an instance"
}

variable "elastic_beanstalk_environment_autoscale_lower_increment" {
  default     = "-1"
  description = "How many Amazon EC2 instances to remove when performing a scaling activity."
}

variable "elastic_beanstalk_environment_autoscale_upper_bound" {
  default     = "80"
  description = "Maximum level of autoscale metric to add an instance"
}

variable "elastic_beanstalk_environment_autoscale_upper_increment" {
  default     = "1"
  description = "How many Amazon EC2 instances to add when performing a scaling activity"
}

variable "elastic_beanstalk_environment_autoscale_min" {
  default     = "2"
  description = "Minumum instances in charge"
}

variable "elastic_beanstalk_environment_autoscale_max" {
  default     = "3"
  description = "Maximum instances in charge"
}

variable "elastic_beanstalk_environment_solution_stack_name" {
  default     = ""
  description = "Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. [Read more](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html)"
}

variable "elastic_beanstalk_environment_wait_for_ready_timeout" {
  default     = "20m"
  description = "The maximum duration that Terraform should wait for an Elastic Beanstalk Environment to be in a ready state before timing out."
}

# From: http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region
# Via: https://github.com/hashicorp/terraform/issues/7071
variable "elastic_beanstalk_environment_alb_zone_id" {
  type = "map"

  default = {
    ap-northeast-1 = "Z1R25G3KIG2GBW"
    ap-northeast-2 = "Z3JE5OI70TWKCP"
    ap-south-1     = "Z18NTBI3Y7N9TZ"
    ap-southeast-1 = "Z16FZ9L249IFLT"
    ap-southeast-2 = "Z2PCDNR3VC2G1N"
    ca-central-1   = "ZJFCZL7SSZB5I"
    eu-central-1   = "Z1FRNW7UH4DEZJ"
    eu-west-1      = "Z2NYPWQ7DFZAZH"
    eu-west-2      = "Z1GKAAAUGATPF1"
    sa-east-1      = "Z10X7K2B4QSOFV"
    us-east-1      = "Z117KPS5GTRQ2G"
    us-east-2      = "Z14LCN19Q5QHIC"
    us-west-1      = "Z1LQECGX5PH1X"
    us-west-2      = "Z38NKT9BP95V3O"
    eu-west-3      = "ZCMLWB8V5SYIT"
  }

  description = "ALB zone id"
}

variable "elastic_beanstalk_environment_env_default_key" {
  default     = "DEFAULT_ENV_%d"
  description = "Default ENV variable key for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "elastic_beanstalk_environment_env_default_value" {
  default     = "UNSET"
  description = "Default ENV variable value for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "elastic_beanstalk_environment_env_vars" {
  default     = {}
  type        = "map"
  description = "Map of custom ENV variables to be provided to the Jenkins application running on Elastic Beanstalk, e.g. `env_vars = { JENKINS_USER = 'admin' JENKINS_PASS = 'xxxxxx' }`"
}

variable "elastic_beanstalk_environment_tier" {
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, e.g. ('WebServer', 'Worker')"
}

variable "elastic_beanstalk_environment_version_label" {
  default     = ""
  description = "Elastic Beanstalk Application version to deploy"
}

variable "elastic_beanstalk_environment_nodejs_version" {
  default     = ""
  description = "Elastic Beanstalk NodeJS version to deploy"
}

variable "elastic_beanstalk_environment_force_destroy" {
  default     = false
  description = "Destroy S3 bucket for load balancer logs"
}

variable "elastic_beanstalk_environment_elb_scheme" {
  default     = "public"
  description = "Specify `internal` if you want to create an internal load balancer in your Amazon VPC so that your Elastic Beanstalk application cannot be accessed from outside your Amazon VPC"
}
