variable "filename" {
  description = "Name of the file to create"
  type        = string
  default     = "hello.txt"
}

variable "content" {
  description = "Content of the file"
  type        = string
  default     = "Hello from Terraform with variables!"
}
