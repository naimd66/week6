provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "esxi-vm" {
  name             = "iac-esxi6"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 1
  memory           = 2048
  guest_id         = "ubuntu64Guest"
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }
  disk {
    label            = "disk0"
    size             = 20
    eagerly_scrub    = false
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
}
```

### Bestand: `cloud-init.yaml`
```yaml
#cloud-config
users:
  - name: testuser
    groups: sudo
    shell: /bin/bash
    ssh-authorized-keys:
      - ${file("~/.ssh/id_rsa.pub")}