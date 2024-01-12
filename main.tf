module "VPC" {
  source       = "./modules/vpc"
  subnet_names = var.subnet_names
}
module "security_group" {
  source = "./modules/sg"
  vpc_id = module.VPC.vpc_id
}
module "EC2" {
  source    = "./modules/ec2"
  sg_id     = module.security_group.sg_id // variable = module.<module_name>.<output_name>
  subnet_id = module.VPC.subnet_id
}
module "alb" {
  source = "./modules/alb"
  sg_id = module.security_group.sg_id
  subnet_id = module.VPC.subnet_id  
  vpc_id = module.VPC.vpc_id
  instance_ids = module.EC2.instance_ids
}


# outputs
output "sg_id" {
  value = module.security_group.sg_id
}
output "ec2_public_ip" {
  value = module.EC2.aws_instance_public_ip
}
output "ec_ids" {
  value = module.EC2.instance_ids
}
output "user_data" {
  value = module.EC2.user_data
}