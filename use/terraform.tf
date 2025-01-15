terraform {
  cloud {
    organization = "<YOUR HCP TERRAFORM ORGANIZATION>"

    workspaces {
      name = "my-workspace"
    }
  }
}
