resource "random_id" "id" {
  byte_length = 8
}

locals {
    id = lower(random_id.id.hex)
  }