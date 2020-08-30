resource "hcloud_server" "rancher_host" {
    name          = "rancher-main"
    server_type   = var.rancher_host_sku
    image         = var.rancher_host_os
    ssh_keys      = [hcloud_ssh_key.root.name]
    user_data     = templatefile("./setup.sh.tmpl", {rancher_version_tag = var.rancher_version_tag, domain = format("%s.%s", var.rancher_host_name, var.dns_zone)})

    connection {
        type           = "ssh"
        host           = hcloud_server.rancher_host.ipv4_address
        user           = "root"
        private_key    = file(var.path_to_private_key)
    }

    provisioner "remote-exec" {
        inline = ["sudo cloud-init status --wait"]
    }
}