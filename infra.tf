
# Fetch available compute zones as data
data "google_compute_zones" "zones" {}

# Create a Google Compute Engine instance
resource "google_compute_instance" "server" {
  # Machine type for the VM
  machine_type = "n1-standard-1"

  # Name for the VM, including the environment variable
  name         = "terragoat-${var.environment}-machine"

  # Zone for the VM, using the first available zone
  zone         = data.google_compute_zones.zones.names[0]

  # Boot disk configuration
  boot_disk {
    initialize_params {
      # Specify the disk image
      image = "debian-cloud/debian-9"
    }
    # Automatically delete the disk when the VM is deleted
    auto_delete = true
  }

  # Network interface configuration
  network_interface {
    # Reference to an existing subnetwork
    subnetwork = google_compute_subnetwork.public-subnetwork.name  # Assuming you have a public subnetwork defined
    access_config {}
  }

  # Allow IP forwarding
  can_ip_forward = true

  # Metadata for the VM
  metadata = {
    # Disable project-wide SSH key blocking
    block-project-ssh-keys = false
    # Disable OS Login
    enable-oslogin         = false
    # Enable serial port
    serial-port-enable     = true
  }

  # Labels for the VM
  labels = {
    git_commit           = "2bdc0871a5f4505be58244029cc6485d45d7bb8e"
    git_file             = "terraform__gcp__instances_tf"
    git_last_modified_at = "2022-01-19-17-02-27"
    git_last_modified_by = "jameswoolfenden"
    git_modifiers        = "jameswoolfenden__nimrodkor"
    git_org              = "bridgecrewio"
    git_repo             = "terragoat"
    yor_trace            = "cd562b76-fbce-4e60-8c75-c9f43d7ffc16"
  }
}

# Create a Google Compute Engine disk
resource "google_compute_disk" "unencrypted_disk" {
  # Name for the disk, including the environment variable
  name = "terragoat-${var.environment}-disk"

  # Labels for the disk
  labels = {
    git_commit           = "2bdc0871a5f4505be58244029cc6485d45d7bb8e"
    git_file             = "terraform__gcp__instances_tf"
    git_last_modified_at = "2022-01-19-17-02-27"
    git_last_modified_by = "jameswoolfenden"
    git_modifiers        = "jameswoolfenden__nimrodkor"
    git_org              = "bridgecrewio"
    git_repo             = "terragoat"
    yor_trace            = "bf87b7d7-a9d8-4f03-a0d4-8a4cbb647d03"
  }
}
