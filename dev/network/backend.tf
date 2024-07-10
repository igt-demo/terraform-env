terraform {
  backend "remote" {
    hostname     = "lifeci.scalr.io"
    organization = "dev"

    workspaces {
      name = "network"
    }
  }
}
