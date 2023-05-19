module "vpc" {
    source = "./modules/network_vpc"
    #depends_on = [ ]
    config = {
        "name"      = var.vpc1.vpc_name
        "project"   = var.project
        "id"        = local.id
        "customer"  = var.customer
    }
}

module "vpc_subnet" {
    source = "./modules/vpc_subnet"
    #depends_on = [
    #    module.vpc
    #]
    config = {
        "name"      = var.vpc1.vpc_subnet_name
        "id"        = local.id
        "customer"  = var.customer
        "region"    = var.region
        "network"   = module.vpc.network_name
    }
}

module "service_account"{
    source = "./modules/service_account"
    #depends_on = [  ]
    config = {
        "account_id"    = var.account_id
        "display_name"  = var.service_account_name
    }
}

module "compute" {
    source = "./modules/compute_engine"
    #depends_on = [ 
    #    module.vpc,
    #    module.service_account
    #]
    config = {
        "name"          = var.compute1.compute_name
        "project"       = var.project
        "id"            = local.id
        "machine_type"  = var.compute1.compute_type
        "zone"          = var.region
        "tags"          = [
            "purpose", "test"
        ]
        "customer"      = var.customer
        "image"         = var.compute1.compute_image
        "scratch_disk"  = var.compute1.compute_scratch_disk
        "network"       = module.vpc.network_name
        "email"         = var.email
        "my_lables"     = var.compute1.my_lables
        }
}

#module "gcr" {
#    source = "./modules/registry_gcr"
    #depends_on = [  ]
#    config = {
#        "project" = var.project
#        "location" = var.location
#        "role" = var.gcr1.gcr_role
#        "member" = var.gcr1.gcr_member
#    }
#}

module "storage" {
    source = "./modules/storage"
    #depends_on = [  ]
    config = {
        "storage_name" = var.gcr1.storage_name
        "location" = var.location
    }
}

module "gke" {
    source = "./modules/gke"
    #depends_on = [  ]
    config = {
        "name" = var.gke1.gke_name
        "location" = var.location
        "initial_node_count" = var.gke1.initial_node_count
        "service_account" = var.email
        "oauth_scopes" = var.gke1.oauth_scopes
        "my_lables" = var.gke1.my_lables
    }
}