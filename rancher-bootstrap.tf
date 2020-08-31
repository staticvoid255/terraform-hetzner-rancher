resource "rancher2_bootstrap" "admin" {
    depends_on = [null_resource.rancher_await_readiness]
    provider = rancher2.bootstrap

    connection {
        type           = "ssh"
        host           = hcloud_server.rancher_host.ipv4_address
        user           = "root"
        private_key    = file(var.path_to_private_key)
    }

    password = var.rancher_admin_password
    telemetry = false
}

resource "rancher2_node_driver" "hcloud_node_driver" {
    depends_on = [null_resource.rancher_await_readiness]
    provider = rancher2.admin

    connection {
        type           = "ssh"
        host           = hcloud_server.rancher_host.ipv4_address
        user           = "root"
        private_key    = file(var.path_to_private_key)
    }

    active = true
    builtin = false
    description = "Hetzner Cloud UI Driver"
    name = "Hetzner"
    ui_url = "https://storage.googleapis.com/hcloud-rancher-v2-ui-driver/component.js"
    url = "https://github.com/JonasProgrammer/docker-machine-driver-hetzner/releases/download/2.1.0/docker-machine-driver-hetzner_2.1.0_linux_amd64.tar.gz"
    whitelist_domains = ["storage.googleapis.com", "*.github.com"]
}