locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "terraform-pc-ddb"
  }
  common_name = "${local.common_tags["Owner"]}-${var.environment}-${var.region}-ddb"
  name = var.name == "" ? local.common_name : var.name
  tags        = merge(local.common_tags, var.tags, { Name = local.common_name })
}