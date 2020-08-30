resource "rancher2_bootstrap" "admin" {
    depends_on = [null_resource.rancher_await_readiness]
    provider = rancher2.bootstrap

    password = var.rancher_admin_password
    telemetry = false
}

resource "rancher2_node_driver" "hcloud_node_driver" {
    depends_on = [null_resource.rancher_await_readiness]
    provider = rancher2.admin

    active = true
    builtin = false
    description = "Hetzner Cloud UI Driver"
    name = "Hetzner"
    ui_url = "https://storage.googleapis.com/hcloud-rancher-v2-ui-driver/component.js"
    url = "https://github.com/JonasProgrammer/docker-machine-driver-hetzner/releases/download/2.1.0/docker-machine-driver-hetzner_2.1.0_linux_amd64.tar.gz"
    whitelist_domains = ["storage.googleapis.com", "*.github.com"]
}