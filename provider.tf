provider "google" {
  credentials = "${file("./serviceaccount.json")}"
  project     = "$GOOGLE_CLOUD_PROJECT"
  region      = "$LOCATION"
}