terraform {
 backend "s3" {
   bucket         = "syn-terraform-state-dev"
   key            = "state/terraform.tfstate"
   region         = "us-east-1"
 }
}