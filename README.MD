## terraform-hetzner-rancher

terraform-hetzner-rancher is a *nearly* production-ready Terraform module allowing for easy deployment of a single-node Rancher installation
on Hetzner Cloud with private cluster networking, SSL support, and provider integrations including:
* Hetzner Node Driver (https://github.com/mxschmitt/ui-driver-hetzner)
* TODO: Hetzner CSI Driver https://github.com/hetznercloud/csi-driver
* Rancher authentication bootstrapping

Comes with the totally non-legally binding promise of being one of the the cheapest ways to run production-ready Kubernetes
~10x cheaper than Azure
~5x cheaper than DigitalOcean

# How to use
```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply -var="hcloud_token=<YOUR.TOKEN>" -var="<YOUR.DNS_TOKEN>" -var="dns_zone=<EXAMPLE.COM>" -var="rancher_host_name=rancher" -var="enable_backups=false"
```
```bash
terraform destroy
```

Your project will now be running 

# TODO:
* Enable High-Availability
* Add VPN support and improve authentication bootstrapping
* Hetzner CSI Driver integration



