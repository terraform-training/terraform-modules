
data "google_compute_default_service_account" "default" {
}

resource "google_service_account" "bastion" {
  account_id   = length(local.name) < 31 ? local.name : substr(local.name, 0, 30)
  display_name = "Bastion Service Account"
}

# resource "google_service_account_iam_member" "bastion_default_sa" {
#   service_account_id = data.google_compute_default_service_account.default.name
#   role               = "roles/iam.serviceAccountUser"
#   member             = "serviceAccount:${google_service_account.bastion.email}"
# }

# data "google_iam_policy" "editor" {
#   # This is to grant permission to someone for use of SA in google_service_account_iam_policy
#   binding {
#     role = "roles/editor"

#     members = [
#       "serviceAccount:${google_service_account.bastion.email}",
#     ]
#   }
# }

# resource "google_service_account_iam_policy" "bastion_editor_iam" {
#   service_account_id = google_service_account.bastion.name
#   policy_data        = data.google_iam_policy.editor.policy_data
# }

resource "google_project_iam_member" "bastion_editor_iam" {
  role   = "roles/editor"
  member = "serviceAccount:${google_service_account.bastion.email}"
}

