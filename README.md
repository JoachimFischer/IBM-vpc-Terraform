# IBM-vpc-Terraform

This Terraform project provide an example for a simple Virtual Provate Cloud (VPC) example with one virtual mashine. It based on IBM Cloud (cloud.ibm.com) with Infrastructure as Code (IaC). You can use the Terraform example native with Comand line, or use the IBM Cloud Schematics solution without local installation.

## Pre-requisit:
1. [Setup an IBM Cloud Account at](https://cloud.IBM.com/)
2. [define a Ressource Group in IAM](https://cloud.ibm.com/account/resource-groups/) like: resource-vpc-space
3. [define your ssh key for VPC infrastrucre:](https://cloud.ibm.com/vpc/compute/sshKeys/) like: user-ssh
4. [define an IBM Cloud API key:](https://cloud.ibm.com/iam/apikeys/)

Using the **IBM Schematics** service, it is not necessary to install Terraform, CLI on you local mashine. You can use it integrated in IBM Cloud Web GUI. A workspace can be added in Schematics with direct connection to GitHuB to access the Terrform definition.

If you have logon into IBM Cloud Account, switch to Schematics and define your Workspace. Therfore you have define the Workspace name, use your Resource group and add the GitHub URL like https://github.com/JoachimFischer/IBM-vpc-Terraform

Now push the button *"Retrieve input variables"* to add your API key and the stored SSH name. Now you can creat teh workspace. In this panel you can also switch between both VPC generations. Change the value of variable *ibmcloud_vpc_generation* from *1* for Generation1 to *2* for Generation2. To get more informaton use following [Link](https://cloud.ibm.com/docs/overview?topic=overview-compare-vpc-vpcoc&origin_team=T02J3DPUE). 

After adding the variable values, use the Terraform function. At first push the button *"Generate plan"*. If this is finalized with no error you can *"Apply plan"*. In this step the installation of the ressources are realized. During the activities you can follow the log view.

With the following IBM-vpc-Terraform example, you can deploy following architecture:
1. One VPC in Frankfurt
2. One Address Prefix in Frankfurt02 data center with *172.21.0.0/21*
3. One SubNet 	*vpc-space-1-eu-de-1-server*  in Frankfurt02 with *172.21.0.0/24*
4. One ACL *vpc-space-1-default-all-acl* for SubNet *vpc-space-1-eu-de-1-server*
5. One VSI in Frankfurt02  	*webapp-eu-de-1*
6. One Floating IP 
7. One Public Gateway

<img src="https://github.com/JoachimFischer/IBM-vpc-Terraform/blob/master/Image/VSI-VPC.png " width="500">

## Change VPC generation
with IBM Schematics, it is very easy to switch between both VPC generations. It is necessary to change the Image types and the server profiles. The Gen1 image "ubuntu-16.04-amd64" is called "ibm-ubuntu-16-04-05-64-minimal-for-vsi" in Gen2 and the Gen1 server profile "cc1-2x4" is called "cx2-2x4". The variables.tf contain the mapping information.

It is also possible to get the information out of Cloud CLI with following comand: $ibmcloud is images   or $ibmcloud is images

## Additional Documentation Provided with Useful links for Terraform and IBM CLoud 
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [The IBM Cloud Provider for Terraform Documentation](https://ibm-cloud.github.io/tf-ibm-docs/index.html)
- [Getting started with IBM Cloud Virtual Private Cloud](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-getting-started)
- [Assigning role-based access to VPC resources](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-assigning-role-based-access-to-vpc-resources)
- [IBM Cloud CLI for VPC Reference](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-infrastructure-cli-plugin-vpc-reference)
- [VPC API](https://cloud.ibm.com/apidocs/vpc-on-classic)
- [IBM Cloud Virtual Private Cloud API error messages](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-rias-error-messages)


