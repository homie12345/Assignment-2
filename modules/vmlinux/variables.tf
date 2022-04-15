variable "linux_name" {
  
}

variable "vm_admin_user"{
    default = "N01517077"
}
variable "linux_availability_set"{
}
# variable "nb_count"{
# }
variable "location"{
}
variable "rg_name"{
}
variable "linux_vm_size" {
  default = "Standard_B1s"
}

variable "linux_admin_ssh_key" {
  type = map(string)
  default = {
    username   = "N01517077"
    public_key = "/home/N01517077/.ssh/id_rsa.pub"
    private_key = "/home/N01517077/.ssh/id_rsa"
  }
}
variable "linux_os_disk_attr" {
  type = map(string)
  default = {
    os_storage_Account_type = "Premium_LRS"
    os_disk_size            = "32"
    os_caching              = "ReadWrite"
  }
}

variable "linux_os_disk_info" {
  type = map(string)
  default = {
    os_publisher = "OpenLogic"
    os_offer     = "CentOS"
    os_sku       = "8_2"
    os_version   = "8.2.2020111800"
  }
}
variable "tags" {

}

variable "subnet_id"{

}

variable "storage_account_uri" {
  
}

#variable "linux_id" {
#  
#}

#variable "manageddisk" {
#  default ="linux-vm-disk"
#}