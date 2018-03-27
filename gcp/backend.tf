terraform {
  backend "gcs" {
    bucket  = "chinrubber-terraform-state"
    path    = "tf/terraform.tfstate"
    project = "chinrubber-admin"
  }
}
