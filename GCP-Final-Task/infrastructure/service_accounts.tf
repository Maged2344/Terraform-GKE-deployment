resource "google_service_account" "custom" {
account_id = "service-acount"
display_name = "service-acount-for-gke"
}

resource "google_project_iam_binding" "custom" {
project = "mythical-height-337311"
role = "roles/container.admin"
depends_on = [
google_service_account.custom
]
members = [
"serviceAccount:${google_service_account.custom.email}"
]
}
