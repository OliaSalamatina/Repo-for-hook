terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
  }
}

provider "random" {}
provider "local" {}

resource "random_pet" "server" {
  length = 2
}

resource "random_integer" "priority" {
  min = 1
  max = 100
}

resource "local_file" "pet_name" {
  content  = "My server pet name is: ${random_pet.server.id}"
  filename = "${path.module}/pet_name.txt"
}

output "pet_name" {
  value = random_pet.server.id
}

output "priority" {
  value = random_integer.priority.result
}