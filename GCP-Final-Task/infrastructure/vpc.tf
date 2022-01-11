resource "google_compute_network" "vpc_network" {
  project                 = "mythical-height-337311"
  name                    = "custom-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}
