# nick-vanadium-takehome

## Please run these commands from within this directory

cd terraform

terraform init

terraform apply

And wait

And wait

And wait

This whole process takes nearly 20 minutes to complete.


The LB url will display in the output at the bottom

Note1: DNS often takes a few minutes to resolve

Note2: This terraform script creates a "unqork-takehome-cluster-xxx" IAM role
- This role has the following AWS IAM policies attached to it
  - AmazonEKSClusterPolicy
  - AmazonEKSVPCResourceController
  - (Custom) unqork-takehome-cluster
    - Grants the cluster the ability to create log groups for itself
  
Enjoy!

(If terraform timeouts after a while, please rerun and it will continue where it left off.)
