terraform {
  backend "remote" {
    hostname     = "lifeci.scalr.io"
    organization = "dev" # environment

    workspaces {
      name = "network"
    }
  }
}
