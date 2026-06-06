terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "example" {
  content = var.content
  filename = "${path.module}/${var.filename}"
}
