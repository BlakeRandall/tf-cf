terraform {
  backend "remote" {
    organization = "blakerandall"
    workspaces {
      name = "tf-cf"
    }
  }

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {}

resource "cloudflare_zone" "this" {
  for_each = { for zone in var.zone : zone.name => zone }

  zone       = each.value.name
  plan       = each.value.plan
  type       = each.value.type
  paused     = each.value.paused
  jump_start = each.value.jump_start
}
