provider "google" {
  credentials = "${file("../creds/serviceaccount.json")}"
  project     = "$GOOGLE_CLOUD_PROJECT"
  region      = "$LOCATION"
}