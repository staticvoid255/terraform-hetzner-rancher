resource "hcloud_network" "rancher_primary_network" {
    name              = "rancher-primary"
    ip_range          = "10.0.1.0/16"
}

resource "hcloud_network_subnet" "cluster_subnet" {
    depends_on = [hcloud_network.rancher_primary_network]

    network_id      = hcloud_network.rancher_primary_network.id
    type            = "cloud"
    network_zone    = "eu-central"
    ip_range        = "10.0.1.0/24"
}