provider "google" {
  project = var.project_id
  region  = "us-central1" # Region is required for some resources
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
    auto_delete = true

  }

  network_interface {
      subnetwork = google_compute_subnetwork.public-subnetwork.name
    access_config {}
  }
 can_ip_forward = true
}
  metadata = {
    block-project-ssh-keys = false
    enable-oslogin         = false
    serial-port-enable     = true
  }
resource "google_compute_disk" "unencrypted_disk" {
  name =  var.vm_name
}☺
