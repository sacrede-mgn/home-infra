resource "proxmox_vm_qemu" "win-server-2016" {
    name = "win-server-2016"
    desc = "test lab"
    tags = "lab"
    target_node = "pve"
    agent = 0
    os_type = "cloud-init"
    cpu {
      cores = 4
      sockets = 1
      type = "host"
    }
    memory = 4096
    scsihw = "virtio-scsi-single"
    onboot = true
    disks {
      scsi {
        scsi0 {
          disk {
            format = "qcow2"
            size            = 60
            cache           = "writeback"
            storage         = "local-data"
            iothread        = true
            discard         = true
          }
        }
      }
      ide {
        ide2 {
          cdrom {
             iso = "local:iso/virtio-win-0.1.189.iso"
          }
        }
        ide3 {
          cdrom {
            iso = "local-data:iso/ru_windows_server_2016_vl_x64_by_AG_04.2019.iso"
          }  
        }
      }
    }

    network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
    }

    boot = "order=scsi0"
}



resource "proxmox_vm_qemu" "win10-ws1" {
    name = "win10-ws1"
    desc = "test lab"
    tags = "lab"
    target_node = "pve"
    agent = 0
    os_type = "cloud-init"
    cpu {
      cores = 4
      sockets = 1
      type = "host"
    }
    memory = 4096
    scsihw = "virtio-scsi-single"
    onboot = true
    disks {
      scsi {
        scsi0 {
          disk {
            format = "qcow2"
            size            = 60
            cache           = "writeback"
            storage         = "local-data"
            iothread        = true
            discard         = true
          }
        }
      }
      ide {
        ide2 {
          cdrom {
             iso = "local:iso/virtio-win-0.1.189.iso"
          }
        }
        ide3 {
          cdrom {
            iso = "local-data:iso/Win10Ltsc_Repack_By_BelyiKrasavec_v.1.8.iso"
          }  
        }
      }
    }

    network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
    }

    boot = "order=scsi0"
}


resource "proxmox_vm_qemu" "win10-ws2" {
    name = "win10-ws2"
    desc = "test lab"
    tags = "lab"
    target_node = "pve"
    agent = 0
    os_type = "cloud-init"
    cpu {
      cores = 4
      sockets = 1
      type = "host"
    }
    memory = 4096
    scsihw = "virtio-scsi-single"
    onboot = true
    disks {
      scsi {
        scsi0 {
          disk {
            format = "qcow2"
            size            = 60
            cache           = "writeback"
            storage         = "local-data"
            iothread        = true
            discard         = true
          }
        }
      }
      ide {
        ide2 {
          cdrom {
             iso = "local:iso/virtio-win-0.1.189.iso"
          }
        }
        ide3 {
          cdrom {
            iso = "local-data:iso/Win10Ltsc_Repack_By_BelyiKrasavec_v.1.8.iso"
          }  
        }
      }
    }

    network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
    }

    boot = "order=scsi0"
}