
# AWS-ELASTIC-BEANSTALK-APPLICATION #

resource "aws_elastic_beanstalk_application" "tftest" {
  name        = "${var.elbeanstalk_app-name}"
  description = "${var.elbeanstalk_app-description}"
}


# AWS-ELASTIC-BEANSTALK-ENVIRONMENT #
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "${var.elbeanstalk_app-environment}"
  application         = "${aws_elastic_beanstalk_application.tftest.name}"
  solution_stack_name = "${var.elbeanstalk_solution_stack}"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id 
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.subnet
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = true
  }

  setting {
    namespace = var.InstanceProfileNamespace
    name      = var.InstanceProfileName
    value     = var.EC2-Role
  }
}