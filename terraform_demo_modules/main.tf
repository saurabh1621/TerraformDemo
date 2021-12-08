module "company_portal" {
  source = "/root/terraform_demo_modules/Modules/Payroll_Application"

  app_region  = var.app_region
  ami             = var.ami_id[var.app_region]
  app_environment = "production"
}
