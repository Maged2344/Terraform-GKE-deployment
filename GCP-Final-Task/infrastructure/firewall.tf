resource "google_compute_firewall" "iap" {
  project = "mythical-height-337311"
  name    = "iap-firewall-rule"
  network = google_compute_network.vpc_network.id


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]

}