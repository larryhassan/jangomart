Deploying a LAMP Stack with Terraform:

Terraform code should be modified to allow better protection and stability for our production environments
We looked at state, building out our Dev, Test, Staging and Production code and protecting the crown, access and security keys to the environment by using Vault to provide one-time use credentials to AWS.
In this step we are going to look at making the script more scalable stable and reusable, by introducing the concept of Terraform modules.
As mentioned, modularizing your code helps to scale when by re-using sections of code across various environments with only the module inputs changing to reflect the build required for the environment at hand.

TERRAFORM MODULE:
A module is a small component of a program that contains one or more routines. In Terraform, it means we separate out a section of the code that is repeated numerous times, across different environments or even within different scripts in the same environment. For instance, building a virtual machine using the enterprise template (which incorporates certain security and resource guidelines).
Terraform modules are a container for resources that are used together. Currently our main.tf script can technically be called a root module as it contains all the resources for our environment, it however contains everything needed to build the environment, including the root VPC, the networks, security groups and details about the webserver and the RDS Database instance.

How do we build a Terraform Module:

Stage
 └ vpc
   └ services
      └ frontend-app
      └ backend-app
         └ main.tf
         └ outputs.tf
         └ variables.tf
  └ data-storage
     └ mysql
     └ redis
 └ modules

