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

output "file_path" {
  description = "Path to the created file"
  value       = local_file.example.filename
}

output "file_content"{
  description = "Content of the created file"
  value       = local_file.example.content
  sensitive   = true
}
