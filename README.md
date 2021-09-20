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

Now push the button *"Retrieve input variables"* to add your API key and the stored SSH name. The information about your API key are available in IAM menue under API Key for classic infrastructure. Now you can creat the workspace. Before starting, please add your SSH key in VPC Infrastructure. THis SSH-key name is added to requesting varibale.


After adding the variable values, use the button of Terraform function. At first push the button *"Generate plan"*. If this is finalized with no error you can *"Apply plan"*. In this step the installation of the ressources are realized. During the activities you can follow the log view.

With the  IBM-vpc-Terraform example, you can deploy following architecture:
1. One VPC in Frankfurt or Dallas
2. One Address Prefix in Frankfurt02 or Dallas1 data center with *172.21.0.0/21*
3. One SubNet 	*vpc-space-eu-de-1-server*  in Frankfurt or Dallas with *172.21.0.0/24*
4. One VSI in Frankfurt  	*servername-eu-de-1*
5. One Floating IP 
6. One Public Gateway
7. One VPN Gateway with a VPC IPSec Connection (optional)

After the infrastructure is deployed you can test it. Logon into the server: ``$ssh root@server-ip``

<img src="https://github.com/JoachimFischer/IBM-vpc-Terraform/blob/master/Image/Terraform-VPC.png" width="700">

It is only possible to access the server via SSH. Therefore only port 22 is allowed.

## Change VPC profiles
With IBM Schematics, it is very easy to switch between VPC flavours. So, please validate the list via CLI comand: 
``$ibmcloud is instance-profiles``

To switch the region to Frankfurt eu-de use following CLI: 
``$ibmcloud target -r eu-de``

The default flavor is: cx2-2x4

It is also possible to get the information of available images out of Cloud CLI with following comand: 
``$ibmcloud is images``   

It is not necessary to install the IBM CLI local, you can use the IBM Cloud Shell out of the Web GUI. If you have logon to the Cloud portal, you find the symbole in the top menue on the right side.

The variables.tf contain the mapping information.


## Additional Documentation Provided with Useful links for Terraform and IBM CLoud 
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [The IBM Cloud Provider for Terraform Documentation](https://ibm-cloud.github.io/tf-ibm-docs/index.html)
- [Getting started with IBM Cloud Virtual Private Cloud](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-getting-started)
- [Assigning role-based access to VPC resources](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-assigning-role-based-access-to-vpc-resources)
- [IBM Cloud CLI for VPC Reference](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-infrastructure-cli-plugin-vpc-reference)
- [VPC API](https://cloud.ibm.com/apidocs/vpc-on-classic)
- [IBM Cloud Virtual Private Cloud API error messages](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-rias-error-messages)


