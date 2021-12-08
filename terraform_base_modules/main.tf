module "VPC" {
    source = "/root/terraform_modules/Modules/VPC"
    cidr_block = "10.0.0.0/16"
    vpc_name_tag = "Base VPC"
}

module "SECURITY_GROUPS" {
    source = "/root/terraform_modules/Modules/SecurityGroups"
    vpc_id = module.VPC.vpc_id
}

module "PUBLIC_SUBNET_01" {
    source = "/root/terraform_modules/Modules/Subnet"
    vpc_id = module.VPC.vpc_id
    cidr_block = "10.0.1.0/24"
    make_subnet_public = true
    subnet_name_tag = "PublicSubnet01"
}

module "PRIVATE_SUBNET_01" {
    source = "/root/terraform_modules/Modules/Subnet"
    vpc_id = module.VPC.vpc_id
    cidr_block = "10.0.2.0/24"
    make_subnet_public = false
    subnet_name_tag = "PrivateSubnet01"
}

module "INTERNET_GATEWAY" {
    source = "/root/terraform_modules/Modules/Gateway"
    vpc_id = module.VPC.vpc_id
    subnet_id = module.PUBLIC_SUBNET_01.subnet_id
}

module "ROUTE_TABLE_ASSOCIATION" {
    source = "/root/terraform_modules/Modules/Route_Table"
    vpc_id = module.VPC.vpc_id
    internet_gateway_id = module.INTERNET_GATEWAY.internet_gateway_id
}

module "VIRTUALMACHINE01" {
    source = "/root/terraform_modules/Modules/VirtualMachines"
    instance_type = "t2.micro"
    instance_key_name = "personal_aws_ohio"
    subnet_id = module.PUBLIC_SUBNET_01.subnet_id
    security_groups = [module.SECURITY_GROUPS.security_group_id]
    instance_name_tag = "Ubuntu-VirtualMachine"
}
