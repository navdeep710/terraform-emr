module "bridge_instance" {
  source                      = "git::https://github.com/cloudposse/terraform-aws-ec2-instance.git?ref=master"
  ssh_key_pair                = module.aws_key_pair.key_name
  vpc_id                      = module.vpc.vpc_id
  subnet                      = module.subnets.public_subnet_ids[0]
  associate_public_ip_address = true
  name                        = "ec2_bridge"
  namespace                   = "eg"
  stage                       = "dev"
  additional_ips_count        = 1
  ebs_volume_count            = 1
  allowed_ports               = [22, 80, 443]
  region = "${var.region}"
  security_groups = [module.vpc.vpc_default_security_group_id]
}

output "emr_access_ip" {
  value = module.bridge_instance.public_ip
}
