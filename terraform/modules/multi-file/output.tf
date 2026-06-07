output "created_files" { 
  value = {for f in local_file.files . f.filename]
}

