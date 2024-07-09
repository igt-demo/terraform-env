terraform {
  backend "remote" {
    hostname     = "lifeci.scalr.io"
    organization = "env-tohonttqkilg1v0" #"dev" # environment

    workspaces {
      name = "network"
    }
  }
}
