resource "hcloud_ssh_key" "root" {
  name = "rancher-root"
  public_key = file(var.path_to_public_key) #must be in openssh format
}