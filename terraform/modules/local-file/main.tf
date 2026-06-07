resource "local_file" "this" {
  content = var.content
  filename = "${path.module}/${var.filename}"
}
