provider "google" {
  region      = "${var.region}"
  credentials = "${file("${var.credentials_file_path}")}"
}

provider "random" {}

resource "random_id" "network_project_id" {
  byte_length = 8
}

resource "google_folder" "shared" {
  display_name = "shared"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "network" {
  display_name = "network"
  parent       = "${google_folder.shared.id}"
}

resource "google_project" "network" {
  name            = "Network"
  billing_account = "${var.billing_account_id}"
  project_id      = "tf-${random_id.network_project_id.hex}"
  folder_id	      = "${google_folder.network.name}"
}

resource "google_project_service" "network" {
  project = "${google_project.network.project_id}"
  service = "compute.googleapis.com"
}

resource "google_compute_shared_vpc_host_project" "network" {
  project    = "${google_project.network.project_id}"
  depends_on = ["google_project_service.network"]
}
