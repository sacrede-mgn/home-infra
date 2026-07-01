
resource "proxmox_vm_qemu" "cloudinit" {
    name = "k8s-master-1"
    desc = "A test for using terraform and cloudinit"
    tags = "k8s"
    target_node = "pve"
    clone = "debian-cloud"
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
    serial {
      id   = 0
      type = "socket"
    }

     vga {
       type = "serial0" # Refers to the serial port with id 0
     } 

    disks {
      ide {
        ide3 {
          cloudinit {
            storage = "local-data"
          }
        }
      }
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
    }

    network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
    }

    boot = "order=scsi0"
    ipconfig0 = "ip=192.168.4.87/24,gw=192.168.4.1"
    ciuser = "sacrede"
  #  cipassword = "temp" 
    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCOhlDpXrttCPfTyUb8XbI2qEqbUwMFmv5xJpu6vze5EjzERG9RkRL0v84qd70HwOFtShPsAfT/CmRdsfy86aGljYxqqelvaD0YHd7SFvN8j3wTvFPBrAE0qxAzuUfewXSCcBfA+OV9UQVUBdxCp+jhZvGAqwp8C6pvMeJ0FDELXmJEEQIDrCMkydm3jBKI3GqWnwMZnlR7FswAYlHJS+AH8zqFtjXplTV3p6xUPTM8b3YXHNacHx3LBAQ/LE23jkE29b1rT8iVmmcu6NxS8Wn7mb1vSoXYlBcSDFMNWbRMblWm7fbnE0Pe/QJNnSy3cf8YjFW9rUlPOXdNXrbNmTc59Y1u3WMK+qJPOmV0XIgKUq3dG50A1UExaNoKThJ37u0kptqzgeItvM/G3urWqrqXcqyL8XwbWIpnh0MftxzDpWQ/bEqz9J60PAOJ6pvj3Dd9femxuM7Fjo5IcJ+ic8HFGRGy39GUm0jErBlzoTs35J5NY+ieWqOiyt8JHvselIUoh6fGXLuvjTyotC6/1YTR+ZXVIlduBfVESQi5b63Ehnrk5gTGbysign2RUl73cZI0MDc/PwlKrfgi5bAAxe5/m4gZqn+/cJPnrtId9S3Smq7vqPQlqAsfd9111D8AIozh7XMUMvOP1CvYc2lQhqvsAazMZcc3v3QtC41KxAl4iQ== root@ansible-master
    EOF
}
 
resource "proxmox_vm_qemu" "cloudinit2" {
    name = "k8s-worker-1"
    desc = "A test for using terraform and cloudinit"
    tags = "k8s"
    target_node = "pve"
    clone = "debian-cloud"
    agent = 0
    os_type = "cloud-init"
    
    cpu {
        cores = 4
        sockets = 1
        type = "host"
    }
    memory = 8000
    scsihw = "virtio-scsi-single"
    onboot = true
    serial {
      id   = 0
      type = "socket"
    }

     vga {
       type = "serial0" # Refers to the serial port with id 0
     } 

    disks {
      ide {
        ide3 {
            cloudinit {
              storage = "local-data"
            }
        }
      }
      scsi {
        scsi0 {
          disk {
            format = "qcow2"
            size            = 200
            cache           = "writeback"
            storage         = "local-data"
            iothread        = true
            discard         = true
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
    ipconfig0 = "ip=192.168.4.88/24,gw=192.168.4.1"
    ciuser = "sacrede"
 #   cipassword = "temp" 
    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCOhlDpXrttCPfTyUb8XbI2qEqbUwMFmv5xJpu6vze5EjzERG9RkRL0v84qd70HwOFtShPsAfT/CmRdsfy86aGljYxqqelvaD0YHd7SFvN8j3wTvFPBrAE0qxAzuUfewXSCcBfA+OV9UQVUBdxCp+jhZvGAqwp8C6pvMeJ0FDELXmJEEQIDrCMkydm3jBKI3GqWnwMZnlR7FswAYlHJS+AH8zqFtjXplTV3p6xUPTM8b3YXHNacHx3LBAQ/LE23jkE29b1rT8iVmmcu6NxS8Wn7mb1vSoXYlBcSDFMNWbRMblWm7fbnE0Pe/QJNnSy3cf8YjFW9rUlPOXdNXrbNmTc59Y1u3WMK+qJPOmV0XIgKUq3dG50A1UExaNoKThJ37u0kptqzgeItvM/G3urWqrqXcqyL8XwbWIpnh0MftxzDpWQ/bEqz9J60PAOJ6pvj3Dd9femxuM7Fjo5IcJ+ic8HFGRGy39GUm0jErBlzoTs35J5NY+ieWqOiyt8JHvselIUoh6fGXLuvjTyotC6/1YTR+ZXVIlduBfVESQi5b63Ehnrk5gTGbysign2RUl73cZI0MDc/PwlKrfgi5bAAxe5/m4gZqn+/cJPnrtId9S3Smq7vqPQlqAsfd9111D8AIozh7XMUMvOP1CvYc2lQhqvsAazMZcc3v3QtC41KxAl4iQ== root@ansible-master
    EOF
}
resource "proxmox_vm_qemu" "cloudinit3" {
    name = "k8s-worker-2"
    desc = "A test for using terraform and cloudinit"
    tags = "k8s"
    target_node = "pve"


    clone = "debian-cloud"

    agent = 0

    os_type = "cloud-init"
    
    cpu {
      cores = 4
      sockets = 1
      type = "host"
    }
    memory = 8000
    scsihw = "virtio-scsi-single"
    onboot = true
    serial {
      id   = 0
      type = "socket"
    }

     vga {
       type = "serial0" # Refers to the serial port with id 0
     } 

    disks {
      ide {
        ide3 {
          cloudinit {
            storage = "local-data"
          }
        }
      }
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
    }

    network {
      id = 0
      model = "virtio"
      bridge = "vmbr0"
    }

    boot = "order=scsi0"
    ipconfig0 = "ip=192.168.4.89/24,gw=192.168.4.1"
    ciuser = "sacrede"
#    cipassword = "temp" 
    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCOhlDpXrttCPfTyUb8XbI2qEqbUwMFmv5xJpu6vze5EjzERG9RkRL0v84qd70HwOFtShPsAfT/CmRdsfy86aGljYxqqelvaD0YHd7SFvN8j3wTvFPBrAE0qxAzuUfewXSCcBfA+OV9UQVUBdxCp+jhZvGAqwp8C6pvMeJ0FDELXmJEEQIDrCMkydm3jBKI3GqWnwMZnlR7FswAYlHJS+AH8zqFtjXplTV3p6xUPTM8b3YXHNacHx3LBAQ/LE23jkE29b1rT8iVmmcu6NxS8Wn7mb1vSoXYlBcSDFMNWbRMblWm7fbnE0Pe/QJNnSy3cf8YjFW9rUlPOXdNXrbNmTc59Y1u3WMK+qJPOmV0XIgKUq3dG50A1UExaNoKThJ37u0kptqzgeItvM/G3urWqrqXcqyL8XwbWIpnh0MftxzDpWQ/bEqz9J60PAOJ6pvj3Dd9femxuM7Fjo5IcJ+ic8HFGRGy39GUm0jErBlzoTs35J5NY+ieWqOiyt8JHvselIUoh6fGXLuvjTyotC6/1YTR+ZXVIlduBfVESQi5b63Ehnrk5gTGbysign2RUl73cZI0MDc/PwlKrfgi5bAAxe5/m4gZqn+/cJPnrtId9S3Smq7vqPQlqAsfd9111D8AIozh7XMUMvOP1CvYc2lQhqvsAazMZcc3v3QtC41KxAl4iQ== root@ansible-master
    EOF

}


