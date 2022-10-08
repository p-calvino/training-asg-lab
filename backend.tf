terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-407372460187"
    key            = "lab/training-asg/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}
