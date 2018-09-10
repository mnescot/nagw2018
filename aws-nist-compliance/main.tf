
data "vault_generic_secret" "dbpass" {
  path = "secret/data/isosecrets/dbpassword"
}


resource "aws_cloudformation_stack" "fisma-vpc" {
  name = "fisma-vpc"

  template_body = "${file("${path.module}/main.template")}"


  capabilities = ["CAPABILITY_IAM"]

  parameters = {
    pDBPassword = "${data.vault_generic_secret.dbpass.data["password"]}"
    pEC2KeyPairBastion = "iso-bastion-nagw"
    pAvailabilityZoneA = "us-east-1b"
    pAvailabilityZoneB = "us-east-1a"
    pEC2KeyPair = "iso-ec2-nagw"


}

}













