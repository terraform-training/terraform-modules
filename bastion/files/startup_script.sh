apt-get update
apt-get install -y curl unzip mysql-client
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
bash add-google-cloud-ops-agent-repo.sh --also-install
service google-cloud-ops-agent restart

