terraform init
terraform plan -var="hcloud_token=" -var="hcloud_dns_token=" -var="dns_zone=staticvoid.network" -var="rancher_host_name=rancher"
terraform apply -var="hcloud_token=" -var="hcloud_dns_token=" -var="dns_zone=staticvoid.network" -var="rancher_host_name=rancher"
terraform destroy -var="hcloud_token=" -var="hcloud_dns_token=" -var="dns_zone=staticvoid.network" -var="rancher_host_name=rancher"