variable "region" {
  default = "europe-west2"
}

variable "region_zone" {
  default = "europe-west2-a"
}

variable "org_id" {
}

variable "billing_account_id" {
}

variable "credentials_file_path" {
  default     = "~/.gcloud/terraform.json"
}
