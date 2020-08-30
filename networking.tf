data "hetznerdns_zone" "dns_zone" {
    name = var.dns_zone
}

resource "hetznerdns_record" "web" {
    depends_on = [hcloud_server.rancher_host]

    zone_id = data.hetznerdns_zone.dns_zone.id
    name = var.rancher_host_name
    value = hcloud_server.rancher_host.ipv4_address
    type = "A"
    ttl= 30
}

resource "hcloud_network" "rancher_primary_network" {
    name              = "rancher-primary"
    ip_range          = "10.0.1.0/8"
}

/*resource "hcloud_server_network" "rancher_host_network_assignment" {
    depends_on = [hcloud_network.rancher_primary_network]

    server_id = hcloud_server.rancher_host.id
    network_id = hcloud_network.rancher_primary_network.id
}*/

resource "hcloud_network_subnet" "rancher_cluster_subnet" {
    depends_on = [hcloud_network.rancher_primary_network]

    network_id      = hcloud_network.rancher_primary_network.id
    type            = "cloud"
    network_zone    = "eu-central"
    ip_range        = "10.0.1.0/24"
}

resource "hcloud_server_network" "rancher_host_subnet_assignment" {
    server_id = hcloud_server.rancher_host.id
    subnet_id = hcloud_network_subnet.rancher_cluster_subnet.id
}
