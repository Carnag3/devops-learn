terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "example" {
  content = "Hello from Terraform!:\nThis file was created by Terraform."
  filename = "${path.module}/hello.txt"
}
