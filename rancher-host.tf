resource "hcloud_server" "rancher_host" {
    name          = "rancher-main"
    server_type   = var.rancher_host_sku
    image         = var.rancher_host_os
    ssh_keys      = [hcloud_ssh_key.root.name]
    user_data     = file("./setup.sh")

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

resource "null_resource" "rancher_host" {
    depends_on      = [hcloud_server.rancher_host, hcloud_rdns.rancher_host_dns_config]

    connection {
        type           = "ssh"
        host           = hcloud_server.rancher_host.ipv4_address
        user           = "root"
        private_key    = file(var.path_to_private_key)
    }

    provisioner "remote-exec" {
        inline = ["sudo docker create --name rancher-data rancher/rancher:${var.rancher_version_tag}",
            "sudo docker run -d --volumes-from rancher-data --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:${var.rancher_version_tag} --acme-domain ${var.rancher_host_name}"]
    }
}