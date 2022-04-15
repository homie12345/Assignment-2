module "network" {
    source = "./modules/network"
    rg_name = module.rgroup.rg_name
    location = module.rgroup.location_name
    vnet_name = "vnet"
    vnet_add_space= ["10.0.0.0/16"]
    subnet_name = "subnet"
    subnet_add_space = ["10.0.1.0/24"]
    nsg_name = "Assignment1-nsg"
    tags = local.common_tags
    depends_on =[
      module.rgroup
    ]
}

module "vmlinux" {
    source = "./modules/vmlinux"
    linux_availability_set = "linux_avs"
    linux_name = {
    "linux17077" = "Standard_B1s"
    "linux27077" = "Standard_B1s"
  }
    #linux_id   = module.vmlinux.linux_vm_id
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    subnet_id = module.network.subnet_id
    storage_account_uri = module.common.storage_account_uri
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.network,
    ]
}

module "vmwindows" {
    source = "./modules/vmwindows"
    windows_name = "winvm7077"
    windows_availability_set = "windows_avs"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    subnet_id = module.network.subnet_id
    storage_account_uri = module.common.storage_account_uri
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.network
   ]
}

module "rgroup" {
    source = "./modules/rgroup"
    location = "canadacentral"
    rg_name = "7077-assignment2-rg"
    tags = local.common_tags
}

#module "datadisk" {
#    source = "./modules/datadisk"
#    location = module.rgroup.location_name
#    rg_name = "7077-assignment2-rg"
#    linux_name = module.vmlinux.linux_vm_hostname
#    linux_id   = module.vmlinux.linux_vm_id
#    win_datadisk3_name = "datadisk3-win"
#    windows_id = module.vmwindows.Windows_VM_Id
#    tags = local.common_tags
#    depends_on =[
#      module.vmwindows,
#      module.vmlinux
#    ]
#}

module "loadbalancer" {
    source = "./modules/loadbalancer"
    lb_name = "assignment1-lb"
    public_ip_lb_name = "publicip-lb"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    subnet_id = module.network.subnet_id
    linux_nic   = module.vmlinux.linux_nic
    windows_nic = module.vmwindows.Windows_vm_nic
    tags = local.common_tags
    depends_on = [
        module.vmlinux,
        module.vmwindows
    ]
    
}

module "common" {
    source = "./modules/common"
    recovery_service_vault_name = "vault"
    log_analytics_workspace_name = "loganalytics-workspace"
    storage_account_name = "7077stoac"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    tags = local.common_tags
    depends_on = [
        module.rgroup,
]
    
}

module "database" {
    source = "./modules/database"
    db_server_name = "postgre-server7077"
    db_name = "postgre_server-db"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    tags = local.common_tags
    depends_on = [
        module.loadbalancer
    ]
    
}