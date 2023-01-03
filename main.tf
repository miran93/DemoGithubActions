module "network" {
  source      = "./modules/network/"
  vpc_cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  availability_zone = var.availability_zone
  subnet_cidr_block = var.subnet_cidr_block
}

module "ElasticBeanstalk" {
    source      = "./modules/ElasticBeanstalk/"
    elbeanstalk_app-name = var.elbeanstalk_app-name
    elbeanstalk_app-description = var.elbeanstalk_app-description
    elbeanstalk_solution_stack = var.elbeanstalk_solution_stack
    elbeanstalk_app-environment = var.elbeanstalk_app-environment
    vpc_id = module.network.vpc_id
    subnet = module.network.subnet_id
    InstanceProfileNamespace = var.InstanceProfileNamespace
    InstanceProfileName = var.InstanceProfileName
    EC2-Role = var.EC2-Role
}