locals {
  private_key = "${file("/Users/aj/.ssh/id_rsa")}"
  public_key  = "${file("/Users/aj/.ssh/id_rsa.pub")}"
  gcp_project = "avian-mile-300915"
}

provider "google" {
  credentials = "${file("/Users/aj/Documents/ons-test-68d7e8ad4263.json")}"
  project = "${local.gcp_project}"
  region  = "eurpoe-west2"
}

 resource "google_storage_bucket" "default-bckt" {
     name = "default-bucket-hghtytfgfter8"
 location = "${var.region}"

}
/*
#export GOOGLE_APPLICATION_CREDENTIALS=/Users/amar5633/Documents/postgress/hsbc-8180904-gsna-dev-256615-6e13f3f79031.json

#/Users/amar5633/Documents/postgress/h

#resource stuff
resource "google_compute_instance" "default" {
  name         = "test01-hellojhgkg" # ${terraform.workspace}"
  machine_type = "n1-standard-1"
  zone         = "europe-west2-b" #might be wrong
  project      =  "${local.gcp_project}"
  tags         = ["foo", "bar"]

  boot_disk {
    initialize_params {
    image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  #scratch_disk {
  #}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  */
/*
  metadata = {
    ssh-keys = "${var.ssh_user}:${local.public_key}"
    #var.gce_ssh_user}:${file("/Users/amar5633/.ssh/id_rsa.pub")}"
    #(var.gce_ssh_pub_key_file}"

    foo = "bar"
  }
  */
/*
  metadata_startup_script = "echo hi > /test.txt"

  provisioner "remote-exec" {
    connection {
      host        = "${self.network_interface.0.access_config[0].nat_ip}"
      type        = "ssh"
      user        = "${var.ssh_user}"
      timeout     = "500s"
      private_key = "${local.private_key}"
    }
    inline = [
      "echo hello",
      #  "sudo yum install -y ansible",
      #  "gsutil cp -r /Users/amar5633/Documents/postgress/target/postgres/ansible/* ${google_storage_bucket.default-bckt.url}",
    ]
  }
  */

  #"gsutil cp -r ${google_storage_bucket.default-bckt.url} "
  #copying files to bucket  
  /*
  provisioner "local-exec" {
    #1. stop checking the finger print of the remote server
    #2. copies file to the gcp bucket
    #3. runs the playbook

   command = <<EOT
        export ANSIBLE_HOST_KEY_CHECKING=false
        gsutil cp -r /Users/amar5633/Documents/ansible-terraform/ansible/* "${google_storage_bucket.default-bckt.url}"
        ansible-playbook -i ${self.network_interface.0.access_config[0].nat_ip}, /Users/amar5633/Documents/postgress/target/postgres/ansible/install-repo.yaml /Users/amar5633/Documents/postgress/target/postgres/ansible/main.yaml /Users/amar5633/Documents/postgress/target/postgres/ansible/install-packages.yaml 
    EOT
  }
  */
#} #end of GCE VM

#  ansible-playbook -i ${self.network_interface.0.access_config[0].nat_ip}, /Users/amar5633/Documents/postgress/target/postgres/ansible/ansible-postgresql/roles/createdb/handlers/main.yml
#   ansible-playbook -i ${self.network_interface.0.access_config[0].nat_ip}, /Users/amar5633/Documents/postgress/target/postgres/ansible/main.yaml
/*
output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config[0].nat_ip}"
}


output "gcs" {
  value = "${google_storage_bucket.default-bckt}"
}
*/
