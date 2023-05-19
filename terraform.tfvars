project     = "dhp-project-ltd"
region      = "asia-southeast1"
customer    = "nambv6"
email       = "nambui906@gmail.com"
account_id  = "nambui906"
location = "EU"
service_account_name = "nambui906"


gcr1  = {
    gcr_role = "roles/storage.objectViewer"
    gcr_member = "nambui906:nambui906@gmail.com"
    storage_name = "nam-test"
}

compute1 = {
    compute_name = "compute1"
    compute_type =  "e2-medium"
    compute_image = "debian-cloud/debian-11"
    compute_scratch_disk      = "SCSI"
    storage_name = "nam-store.com"
    my_lables = "test"
}

vpc1 = {
    vpc_name = "network1"
    vpc_subnet_name = "vpc_subnet1"
}

gke1 = {
    initial_node_count = 3
    gke_name = "nam_gke"
    oauth_scopes = "https://www.googleapis.com/auth/cloud-platform"
}


