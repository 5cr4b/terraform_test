variable "project" {
  type = string
}

variable "region" {
  type= string 
}

variable "customer" {
  type  = string 
}

variable "email" {
  type = string
}

variable "account_id" {
    type = string
}

variable "location" {
  type = string
}

variable "service_account_name" {
  type = string 
}

variable "vpc1" {
  type = object({
    vpc_name = string
    vpc_subnet_name = string
  }
  )
}


variable "compute1" {
  type = object({
    compute_name = string
    compute_type = string
    compute_image = string 
    compute_scratch_disk = string 
    my_lables = string
  })
}

variable "gcr1" {
  type = object({
    gcr_role = string 
    gcr_member = string
    storage_name = string 
  })
}

variable "gke1" {
  type = object({
    gke_name = string 
    initial_node_count = number
    oauth_scopes = string 
    my_lables = string
  })
}