terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

module "my_file" {
  source  = "./modules/local-file"

  filename = "module-demo.txt"
  content  = "Этот файл создан через Terraform Module!"
}
