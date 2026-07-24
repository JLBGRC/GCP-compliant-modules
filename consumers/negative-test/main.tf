#negative-test main.tf
terraform {
  required_version = ">= 1.6"
  required_providers {
    google = { source = "hashicorp/google", version = "~> 5.0" }
  }
}

provider "google" {
  project = "project-94903126-3a33-4d3e-a3a"
  region  = "us-central1"
}

module "data_bucket" {
  source = "../../modules/compliant-gcs-bucket"

  gcp_project        = "project-94903126-3a33-4d3e-a3a"
  project_label      = "cgep-lab"
  environment        = "prod"
  retention_days     = 30   # Learn the rules like a pro, so you can break them like an artist. Pablo Picasso.
  bucket_name_suffix = "badbucket-should-never-exist"
}