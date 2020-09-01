# terraform-hetzner-rancher

terraform-hetzner-rancher is a *nearly* production-ready Terraform module allowing for easy deployment of a single-node Rancher installation
on Hetzner Cloud with private cluster networking, SSL support, and provider integrations including:
* Hetzner Node Driver (https://github.com/mxschmitt/ui-driver-hetzner)
* TODO: Hetzner CSI Driver (https://github.com/hetznercloud/csi-driver)
* Rancher authentication bootstrapping

Comes with the totally non-legally binding promise of being one of the the cheapest ways to run production-ready Kubernetes
* ~10x cheaper than Azure
* ~5x cheaper than DigitalOcean
Great for Dev environments where high-availability is a low priority, allowing you to quickly and cheaply stand up environments
and take advantage of Rancher's extensive application catalog with full Helm3 support.

## How to use
Ensure you have a DNS zone set up in the Hetzner DNS console for your target domain e.g. example.com, then cd to the project
clone directory and run:
```bash
terraform init
```
Review the execution plan with:
```bash
terraform plan
```
Run the plan, replacing inline parameters wit your own values. This is the bare minimum required to set up Rancher, for other parameters see the variables file:
```bash
terraform apply -var="hcloud_token=<YOUR.TOKEN>" -var="<YOUR.DNS_TOKEN>" -var="dns_zone=<EXAMPLE.COM>" -var="rancher_host_name=rancher" -var="enable_backups=true"
```
Rancher will now be available at rancher.<EXAMPLE.COM>
Destroy with:
```bash
terraform destroy
```


## TODO:
* Add outputs (highest priority)
* Enable High-Availability
* Add VPN support and improve authentication bootstrapping
* Hetzner CSI Driver integration



