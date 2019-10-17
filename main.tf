resource "aws_security_group" "elastic_beanstalk_sg" {
  name        = "elastic_beanstalk_sg"
  description = "Elastic Beanstalk security group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.elastic_beanstalk_lb_sg.id}"]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = ["${aws_security_group.elastic_beanstalk_lb_sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(
    var.tags,
    map(
      "Name", "elastic_beanstalk_sg"
    )
  )}"
}

resource "aws_security_group" "elastic_beanstalk_lb_sg" {
  name        = "elastic_beanstalk_lb_sg"
  description = "Elastic Beanstalk LB security group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(
    var.tags,
    map(
      "Name", "elastic_beanstalk_lb_s"
    )
  )}"
}

module "elastic_beanstalk_application" {
  source    = "git::https://github.com/cloudposse/terraform-aws-elastic-beanstalk-application.git?ref=0.1.6"
  namespace = "${var.elastic_beanstalk_application_namespace}"
  stage     = "${var.elastic_beanstalk_application_stage}"
  name      = "${var.elastic_beanstalk_application_name}"

  tags = "${var.tags}"
}

module "elastic_beanstalk_environment" {
  source = "git::https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment.git?ref=0.13.0"

  # Custom configuration
  app                          = "${module.elastic_beanstalk_application.app_name}"
  loadbalancer_security_groups = ["${aws_security_group.elastic_beanstalk_lb_sg.id}"]
  security_groups              = ["${aws_security_group.elastic_beanstalk_sg.id}"]
  tags                         = "${var.tags}"
  vpc_id                       = "${var.vpc_id}"

  # All variables available in the module
  alb_zone_id                          = "${var.elastic_beanstalk_environment_alb_zone_id}"
  application_port                     = "${var.elastic_beanstalk_environment_application_port}"
  associate_public_ip_address          = "${var.elastic_beanstalk_environment_associate_public_ip_address}"
  attributes                           = "${var.elastic_beanstalk_environment_attributes}"
  autoscale_lower_bound                = "${var.elastic_beanstalk_environment_autoscale_lower_bound}"
  autoscale_lower_increment            = "${var.elastic_beanstalk_environment_autoscale_lower_increment}"
  autoscale_max                        = "${var.elastic_beanstalk_environment_autoscale_max}"
  autoscale_measure_name               = "${var.elastic_beanstalk_environment_autoscale_measure_name}"
  autoscale_min                        = "${var.elastic_beanstalk_environment_autoscale_min}"
  autoscale_statistic                  = "${var.elastic_beanstalk_environment_autoscale_statistic}"
  autoscale_unit                       = "${var.elastic_beanstalk_environment_autoscale_unit}"
  autoscale_upper_bound                = "${var.elastic_beanstalk_environment_autoscale_upper_bound}"
  autoscale_upper_increment            = "${var.elastic_beanstalk_environment_autoscale_upper_increment}"
  availability_zones                   = "${var.elastic_beanstalk_environment_availability_zones}"
  config_document                      = "${var.elastic_beanstalk_environment_config_document}"
  config_source                        = "${var.elastic_beanstalk_environment_config_source}"
  delimiter                            = "${var.elastic_beanstalk_environment_delimiter}"
  description                          = "${var.elastic_beanstalk_environment_description}"
  elb_scheme                           = "${var.elastic_beanstalk_environment_elb_scheme}"
  enable_log_publication_control       = "${var.elastic_beanstalk_environment_enable_log_publication_control}"
  enable_managed_actions               = "${var.elastic_beanstalk_environment_enable_managed_actions}"
  enable_stream_logs                   = "${var.elastic_beanstalk_environment_enable_stream_logs}"
  enhanced_reporting_enabled           = "${var.elastic_beanstalk_environment_enhanced_reporting_enabled}"
  env_default_key                      = "${var.elastic_beanstalk_environment_env_default_key}"
  env_default_value                    = "${var.elastic_beanstalk_environment_env_default_value}"
  env_vars                             = "${var.elastic_beanstalk_environment_env_vars}"
  environment_type                     = "${var.elastic_beanstalk_environment_environment_type}"
  force_destroy                        = "${var.elastic_beanstalk_environment_force_destroy}"
  health_streaming_delete_on_terminate = "${var.elastic_beanstalk_environment_health_streaming_delete_on_terminate}"
  health_streaming_enabled             = "${var.elastic_beanstalk_environment_health_streaming_enabled}"
  health_streaming_retention_in_days   = "${var.elastic_beanstalk_environment_health_streaming_retention_in_days}"
  healthcheck_url                      = "${var.elastic_beanstalk_environment_healthcheck_url}"
  http_listener_enabled                = "${var.elastic_beanstalk_environment_http_listener_enabled}"
  instance_refresh_enabled             = "${var.elastic_beanstalk_environment_instance_refresh_enabled}"
  instance_type                        = "${var.elastic_beanstalk_environment_instance_type}"
  keypair                              = "${var.elastic_beanstalk_environment_keypair}"
  loadbalancer_certificate_arn         = "${var.elastic_beanstalk_environment_loadbalancer_certificate_arn}"
  loadbalancer_managed_security_group  = "${var.elastic_beanstalk_environment_loadbalancer_managed_security_group}"
  loadbalancer_ssl_policy              = "${var.elastic_beanstalk_environment_loadbalancer_ssl_policy}"
  loadbalancer_type                    = "${var.elastic_beanstalk_environment_loadbalancer_type}"
  logs_delete_on_terminate             = "${var.elastic_beanstalk_environment_logs_delete_on_terminate}"
  logs_retention_in_days               = "${var.elastic_beanstalk_environment_logs_retention_in_days}"
  name                                 = "${var.elastic_beanstalk_environment_name}"
  namespace                            = "${var.elastic_beanstalk_environment_namespace}"
  nodejs_version                       = "${var.elastic_beanstalk_environment_nodejs_version}"
  notification_endpoint                = "${var.elastic_beanstalk_environment_notification_endpoint}"
  notification_protocol                = "${var.elastic_beanstalk_environment_notification_protocol}"
  notification_topic_arn               = "${var.elastic_beanstalk_environment_notification_topic_arn}"
  notification_topic_name              = "${var.elastic_beanstalk_environment_notification_topic_name}"
  preferred_start_time                 = "${var.elastic_beanstalk_environment_preferred_start_time}"
  private_subnets                      = "${var.elastic_beanstalk_environment_private_subnets}"
  public_subnets                       = "${var.elastic_beanstalk_environment_public_subnets}"
  rolling_update_type                  = "${var.elastic_beanstalk_environment_rolling_update_type}"
  root_volume_size                     = "${var.elastic_beanstalk_environment_root_volume_size}"
  root_volume_type                     = "${var.elastic_beanstalk_environment_root_volume_type}"
  solution_stack_name                  = "${var.elastic_beanstalk_environment_solution_stack_name}"
  ssh_listener_enabled                 = "${var.elastic_beanstalk_environment_ssh_listener_enabled}"
  ssh_listener_port                    = "${var.elastic_beanstalk_environment_ssh_listener_port}"
  ssh_source_restriction               = "${var.elastic_beanstalk_environment_ssh_source_restriction}"
  stage                                = "${var.elastic_beanstalk_environment_stage}"
  stickiness_enabled                   = "${var.elastic_beanstalk_environment_stickiness_enabled}"
  stickiness_lb_cookie_duration        = "${var.elastic_beanstalk_environment_stickiness_lb_cookie_duration}"
  tier                                 = "${var.elastic_beanstalk_environment_tier}"
  update_level                         = "${var.elastic_beanstalk_environment_update_level}"
  updating_max_batch                   = "${var.elastic_beanstalk_environment_updating_max_batch}"
  updating_min_in_service              = "${var.elastic_beanstalk_environment_updating_min_in_service}"
  version_label                        = "${var.elastic_beanstalk_environment_version_label}"
  wait_for_ready_timeout               = "${var.elastic_beanstalk_environment_wait_for_ready_timeout}"
  zone_id                              = "${var.elastic_beanstalk_environment_zone_id}"
}
