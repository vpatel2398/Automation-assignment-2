resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.vm1
  ]

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type     = "ssh"
      user     = var.username
      password = var.password
      host     = element(azurerm_linux_virtual_machine.vm1[*].public_ip_address, count.index + 1)
    }
  }
}