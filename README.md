# IBM-vpc-Terraform

Using IBM Cloud (cloud.ibm.com) with Infrastructure as Code (IaC) based on Terraform for Virtual Private Clouds (VPCs)


## Pre-requisit:
1. [Setup an IBM Cloud Account at](https://cloud.IBM.com/)
2. [define a Ressource Group in IAM](https://cloud.ibm.com/account/resource-groups/) like: resource-vpc-space
3. [define your ssh key for VPC infrastrucre:](https://cloud.ibm.com/vpc/compute/sshKeys/) like: user-ssh
4. [define an IBM Cloud API key:](https://cloud.ibm.com/iam/apikeys/)

Using the **IBM Schematics** service, it is not necessary to install Terraform, CLI on you local mashine. You can use it integrate in IBM Cloud Web GUI. A workspace can be added in Schematics with direct connection to GitHuB to access the Terrform definition.

If you have logon into IBM Cloud Account, switch to Schematics and define your Workspace. Therfore you have define the Workspace name, use your Resource group and add the GitHub URL like https://github.com/JoachimFischer/IBM-vpc-Terraform

How push the button "Retrieve input variables" to add your API key and the stored SSH name. Now you can creat teh workspace. The following activities are the same as use the Terraform function in command line editor. At first push the button "Generate plan". If this is finalized with no error you can "Apply plan". In this step the installation of the ressources are realized. During the activities you can follow the log view.

With the following IBM-vpc-Terraform example, you can deploy following architecture:
1. One VPC in Frankfurt
2. One Address Prefix in Frankfurt02 data center with *172.21.0.0/21*
3. One SubNet 	*vpc-space-1-eu-de-1-server*  in Frankfurt02 with *172.21.0.0/24*
4. One ACL *vpc-space-1-default-all-acl* for SubNet *vpc-space-1-eu-de-1-server*
5. One VSI in Frankfurt02  	*webapp-eu-de-1*
6. One Floating IP 
7. One Public Gateway

## Change VPC generation
with IBM Schematics, it is very easy to switch between both VPC generations. It is necessary to change the Image types and the server profiles. The Gen1 image "ubuntu-16.04-amd64" is called "ibm-ubuntu-16-04-05-64-minimal-for-vsi" in Gen2 and the Gen1 server profile "cc1-2x4" is called "cx2-2x4". 

## Additional Documentation Provided with Useful links for Terraform and IBM CLoud 
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [The IBM Cloud Provider for Terraform Documentation](https://ibm-cloud.github.io/tf-ibm-docs/index.html)
- [Getting started with IBM Cloud Virtual Private Cloud](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-getting-started)
- [Assigning role-based access to VPC resources](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-assigning-role-based-access-to-vpc-resources)
- [IBM Cloud CLI for VPC Reference](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-infrastructure-cli-plugin-vpc-reference)
- [VPC API](https://cloud.ibm.com/apidocs/vpc-on-classic)
- [IBM Cloud Virtual Private Cloud API error messages](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-rias-error-messages)


