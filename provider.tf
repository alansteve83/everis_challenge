provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "core-photon-278101"
  region      = "us-central1"
}