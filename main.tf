module "vpc" {
    source = "./modules/network_vpc"
    depends_on = [ ]
    config = {
        "name"      = var.vpc_name
        "project"   = var.project
        "id"        = local.id
        "customer"  = var.customer
    }
}

module "vpc_subnet" {
    source = "./modules/vpc_subnet"
    depends_on = [
        module.vpc
    ]
    config = {
        "name"      = var.vpc_subnet_name
        "id"        = local.id
        "customer"  = var.customer
        "region"    = var.region
        "network"   = module.vpc.network_name
    }
}

module "service_account"{
    source = "./modules/service_account"
    depends_on = [  ]
    config = {
        "account_id"    = local.account_id
        "display_name"  = var.service_account_name
    }
}

module "compute" {
    source = "./modules/compute_engine"
    depends_on = [ 
        module.vpc,
        module.service_account
    ]
    config = {
        "name"          = var.comput_name
        "project"       = var.project
        "id"            = local.id
        "machine_type"  = var.compute_type
        "zone"          = var.region
        "tags"          = [
            "purpose", "test"
        ]
        "customer"      = local.customer
        "image"         = var.compute_image
        "scratch_disk"  = var.compute_scratch_disk
        "network"       = module.vpc.network_name
        "email"         = local.email
        }
}

module "gcr" {
    source = "./modules/registry_gcr"
    depends_on = [  ]
    config = {
        "project" = var.project
        "location" = var.location
        "role" = var.gcr_role
        "member" = var.gcr_member
    }
}

module "storage" {
    source = "./modules/storage"
    depends_on = [  ]
    config = {
        "name" = var.storage_name
        "location" = var.location
    }
}

module "gke" {
    source = "./modules/gke"
    depends_on = [  ]
    config = {
        "name" = var.gke_name
        "location" = var.location
        "initial_node_count" = var.initial_node_count
        "service_account" = var.email
        "oauth_scopes" = var.oauth_scopes
    }
}