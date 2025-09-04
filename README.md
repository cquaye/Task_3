# GCP_Loadbalancer Task 3

# Terraform Guide: Internal Load Balancer with Windows VM and Firewall Rules


This guide walks through deploying an Internal Load Balancer (ILB), a Windows VM, firewall rules for access to a Linux web server, and RDP access to the Windows VM using Terraform. The setup allows secure communication between the Windows VM and Linux servers while exposing RDP only to necessary sources.

## Create your file structure
- This will be how you organize your code. you can beak it up in the classic 'main.tf', 'variables.tf', and 'outupts.tf' files. 
- Or you can separate each resource code block by it's function. 'subnets.tf', 'firewall.tf' etc..

## Define your Provider and Project variables. 
- Ensure you have the correct porject and credential key assigned to your terraform code. 
- Create your variables to be used in the project.

## Define your network and subnets
- Create your vpc network with it's configurations
- Create both your priamary and your dedicated proxy-only subnets. These will be necessary later on

## Define your router
- Create the necessary configuraations for your router
- MAKE SURE THIS IS APPLIED TO THE PROPER SUBNET AND REGION

## Define your nat
- Create the nessary configurations for your NAT
- MAKE SURE THIS IS APPLIED TO THE PROPER SUBNET AND REGION 

## Define your firewalll
- Create your firewall rule for your rdp
 - Ensure this allows for any ip access to this Windows server. 
 - This will be necessary later when your team RDPs into your server. 
 - Make sure the rule includes the network tag you created for your windows vm

- Create yoru fiewall rule for http access
 - This will allow the Windows VM to reach your linux webservers. 
 - Make sure the rule includes the network tag you created for your linux vm in your instance template. 

 ## Define your instance template
 - This is the linux vm template that your manage instance group will use to create vm. 
  - Ensure you apply a network tag to indentify these machines in your firewall. 

## Define your Manage instance group
- This will apply the instance template you created and deploy the number of linux VMs you have assigned. 

## Define your healthcheck
- This will determine if you have a healthly cluster to work with. 

## Define your autosclaer
- This is to help with traffic load. It will spin up to meet high traffic demand and spin down when traffic is low. 

## Define your internal load balancer
- This sometimes is broken up into your backend and fronend pieces. 
 - These act as the proxy and service provider for your linux vm. 
 - This will have it's own health checks and apply the proxy-only subnet to be functional. 

## Define your Windows server
- One of the final steps is to create your windows machine. 
 - This is only way to reach your linux vm and the jumpbox for your team memmber to reach your environment. 
 - Be sure to apply your network tags to this machine so the firewall can allow traffic. 


 ## Operations
 - Deploy your terraform configurations to your environment. 
 - If all has been configured correctly there will be no errors
 - In the GCP console you should see:
     1. Linux (internal IP address only) and Windows VM (External and internal IP addresses)
     2. Subnetwork and your proxy-only subnetwork
     3. Your router, NAT, and Load balancer
     4. Firewall rules that are defined source and destinations via network tags

## Testing functionality.
- Login to your Windows VM with the auto generated credentials. 
  - Navigate to your web browser and apply the internal IP addresses of your linux machines. 

## Group members accessing machinges
- In this section, you have to create a user account for your members to use to access your environment via RDP
    1. Create a new user via the Computer Management configuration section. 
    2. Add that newly created user to the Remote Desktop Users group. 
    3. Share this external IP address and user credentails with your team.
- Now each member should be able to remote into your system. 
    - applying the External IP of your Windows machine and user credentials. 
    - Navigating to the web browser as was done in the testing phase. 
    - Using the internal IP address of your linux machines to vaildate connectivity. 

## Deliverables
- Each member of the group should have these items:
    [*] Screen shot list of everey member of the groups Windows external IP and linux internal IP
    [*] Screen shot of access into each members VM and the Web page of each linux web server. 