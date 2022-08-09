resource "null_resource" "ansible-deploy" {
  provisioner "local-exec" {
    command = "export ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook --private-key ~/.ssh/id_rsa -i ansible/hosts ansible/playbook.yml"
  }
  
}