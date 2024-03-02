# Provider declaration
terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
}

# Adding a default SSH-key
resource "twc_ssh_key" "example-key" {
  name = "terraform-eshop-deploy-key"
  body = file("~/.ssh/id_rsa.pub")
}

# Specifying the required Operating System
data "twc_os" "os" {
  name    = "ubuntu"
  version = "22.04"
}


# Specifying the required server presets
data "twc_presets" "master-preset" {
  disk_type = "ssd"
  cpu = 2
  price_filter {
    from = 400
    to   = 505
  }
}

data "twc_presets" "worker-preset" {
  disk_type = "ssd"
  price_filter {
    from = 550
    to   = 700
  }
}

# Declaring resources
resource "twc_server" "master" {
  name         = "Master"
  preset_id    = data.twc_presets.master-preset.id
  os_id        = data.twc_os.os.id
  ssh_keys_ids = [twc_ssh_key.example-key.id]
}

# Specifying the amount of workers
variable "workers-amount" {
  default = 1
}

resource "twc_server" "worker" {
  count        = var.workers-amount
  name         = "Worker-${count.index + 1}"
  preset_id    = data.twc_presets.worker-preset.id
  os_id        = data.twc_os.os.id
  ssh_keys_ids = [twc_ssh_key.example-key.id]
}


# Outputting the IP addresses of the created servers
output "master_ip" {
  value = twc_server.master.main_ipv4
}

output "workers_ips" {
  value = [for worker in twc_server.worker : worker.main_ipv4]
}