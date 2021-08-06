resource "google_service_account" "k8s" {
  account_id   = length(local.name) < 31 ? local.name : substr(local.name, 0, 30)
  display_name = "Kubernetes Node Service Account"
}

resource "google_project_iam_member" "k8s_editor_iam" {
  role   = "roles/editor"
  member = "serviceAccount:${google_service_account.k8s.email}"
}

resource "google_project_iam_member" "k8s_editor_iam_storage_admin" {
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.k8s.email}"
}
