output "bucket_name" {
  value = google_storage_bucket.main.name
}

output "self_link" {
  value = google_storage_bucket.main.self_link
}

output "url" {
  value = google_storage_bucket.main.url
}
