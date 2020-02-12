# IBM-vpc-Terraform

This Terraform project provide an example for a simple Virtual Provate Cloud (VPC) example with one virtual mashine. It based on IBM Cloud (cloud.ibm.com) with Infrastructure as Code (IaC). You can use the Terraform example native with Comand line, or use the [IBM Cloud Schematics](https://cloud.ibm.com/schematics/overview) solution without local installation.

If you have no IBM Cloud Account, please start with following pre-requsit:

## Pre-requisit:
1. [Setup an IBM Cloud Account at](https://cloud.IBM.com/)
2. [define a Ressource Group in IAM](https://cloud.ibm.com/account/resource-groups/) like: resource-vpc-space
3. [define your ssh key for VPC infrastrucre:](https://cloud.ibm.com/vpc/compute/sshKeys/) like: user-ssh. If you use both VPC generations, it is necessary to define it twice.
4. [define an IBM Cloud API key:](https://cloud.ibm.com/iam/apikeys/)

Using the **IBM Schematics** service, it is **not** necessary to install Terraform, CLI on you local mashine. You can use it integrated in IBM Cloud Web GUI. A workspace can be added in Schematics with direct connection to GitHuB to access the Terrform definition.

If you have logon into IBM Cloud Account, switch to [Schematics](https://cloud.ibm.com/schematics/overview) and define your Workspace. Therfore you have define the Workspace name, use your Resource group and add the GitHub URL like https://github.com/JoachimFischer/IBM-vpc-Terraform

Now push the button *"Retrieve input variables"* to add your API key and the stored SSH name. Now you can creat teh workspace. In this panel you can also switch between both VPC generations. Change the value of variable *ibmcloud_vpc_generation* from *1* for Generation1 to *2* for Generation2. It is necessary to change the server image type and the server profile if you switch between VPC generations. To get more informaton use following [Link](https://cloud.ibm.com/docs/overview?topic=overview-compare-vpc-vpcoc&origin_team=T02J3DPUE). 

After adding the variable values, use the button of Terraform function. At first push the button *"Generate plan"*. If this is finalized with no error you can *"Apply plan"*. In this step the installation of the ressources are realized. During the activities you can follow the log view.

With the  IBM-vpc-Terraform example, you can deploy following architecture:
1. One VPC in Frankfurt or Dallas
2. One Address Prefix in Frankfurt02 or Dallas1 data center with *172.21.0.0/21*
3. One SubNet 	*vpc-space-1-eu-de-1-server*  in Frankfurt02 or Dallas with *172.21.0.0/24*
4. One VSI in Frankfurt02  	*webapp-eu-de-1*
5. One Floating IP 
6. One Public Gateway

<img src="https://github.com/JoachimFischer/IBM-vpc-Terraform/blob/master/Image/VSI-VPC.png " width="500">

## Change VPC generation
With IBM Schematics, it is very easy to switch between both VPC generations. The image types for Gen1 and Gen2 are using actual the same naming conventions. But not all Images von Gen1 are available in Gen2 actual. So, please validate the list via CLI comand: $ibmcloud is target --gen 2

In Gen1 and the Gen2 the server profile name use following naming convention: "cc1-2x4" is called "cx2-2x4". But in Gen2 there are more flavours like Power systems with "bp2-2x8" or "gp2-24x224x2". The full list is available via CLI: $ibmcloud is instance-profiles   if you have switched between Gen1 and Gen2 and use the region where Gen2 is available like $ibmcloud target -r us-south  

The variables.tf contain the mapping information.

It is also possible to get the information out of Cloud CLI with following comand: $ibmcloud is images   or $ibmcloud is images

## Additional Documentation Provided with Useful links for Terraform and IBM CLoud 
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [The IBM Cloud Provider for Terraform Documentation](https://ibm-cloud.github.io/tf-ibm-docs/index.html)
- [Getting started with IBM Cloud Virtual Private Cloud](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-getting-started)
- [Assigning role-based access to VPC resources](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-assigning-role-based-access-to-vpc-resources)
- [IBM Cloud CLI for VPC Reference](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-infrastructure-cli-plugin-vpc-reference)
- [VPC API](https://cloud.ibm.com/apidocs/vpc-on-classic)
- [IBM Cloud Virtual Private Cloud API error messages](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-rias-error-messages)


