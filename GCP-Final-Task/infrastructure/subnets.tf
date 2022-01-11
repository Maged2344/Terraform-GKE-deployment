resource "google_compute_subnetwork" "Management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "europe-west2"
  network       = google_compute_network.vpc_network.id
}
resource "google_compute_router" "router" {
  name    = "my-router"
  region  = google_compute_subnetwork.Management-subnet.region
  network = google_compute_network.vpc_network.id

  bgp {
    asn = 64514
  }
}
########################################################
resource "google_compute_router_nat" "nat" {
  name                               = "my-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.Management-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

}
#########################################################
resource "google_compute_instance" "private_vm" {
  name         = "private"
  machine_type = "e2-micro"
  zone         = "europe-west2-b"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.Management-subnet.id

  }

}
########################################################
resource "google_compute_subnetwork" "Restricted" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = "europe-west2"
  network       = google_compute_network.vpc_network.id

}