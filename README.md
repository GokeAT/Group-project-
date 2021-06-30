# DevOps  Final Project (Group)

During our training with QA to become a DevOps Engineer, for our final project we were tasked with deploying an application as a group. The applications were for the 'Spring Pet Clinic Domain'; one serving as the front end client using AngularJS whilst another an API using Java

We were tasked with planning, designing & implementing a solution for automating the development workflows aswell as deployment of the application.

For Our Project:

Jenkins was used for Deployment

Karma was used for testing

Docker was used for module containerisation 

Kubernetes was used for orchestration

Terraform was used for Configuration Management

Nginx was used for load balancing 

## Pet Clinic Application

The application was a website that uses CRUD functionality to allow users to add, edit or remove pets & their owners from the database. Owners have certain attributes attached to them; name, address, city, telephone & pets owned. Whilst pets also had their own attributes namely;

# Contents

* [Software Design](#Software-Design)
    * [Planning](#Planning)
    * [Risk Assessment](#Risk-Assessment)
    * [Test plan](#Test-plan)
* [Conntinuous Deployment and Integration](#Continuous-Deployment-and-Integration)  
* [Architecture](#Architectures)
* [Front-End Design](#Front-End-Design)
* [Back-End Design](#Back-End-Design)
* [Authors](#Authors)

# Software Design

Altohugh we have only been tasked with deployment; it is worth noting the app was developed mainly using HTML, CSS, Typescript & Java

## Planning

Planning for the project was done using a Jira Board as not only is it free to use but it also allowed us as a group to alter tasks between "to do", "in progress" & "done". As each individual completes their task; they would move it to the done stage before then working on a new "to do" task & placing it in the "in progress" stage.

An initial jira board was made during deployment:

![jiraboard](https://user-images.githubusercontent.com/48153566/123998741-af70ef00-d9c9-11eb-8b4f-f42fcb62194e.png)

A new Jira board was then created after deployment has been completed:


## Risk Assessment

A risk assessment register was made to identify the potential risks faced by the project and how they would be prevented and dealt with upon occurence. The risk assessment register contains the risk, description of the risk, probability of the risk happening, impact of the risk if it does happen, P*I  (which outlines the serverity of the risk; green being easy to handle & red being worst consequences), Control Measures to to ensure the risk doesn't happen and the response to deal with the risk if it does happen

Risk assessment Register:

![finalgroupriskassessment](https://user-images.githubusercontent.com/48153566/123999530-88ff8380-d9ca-11eb-824e-2d95478e5533.png)


# Test Plan

Test plans were also used to identify what sections of the program were expected to be tested & how


# Continuous Integration

Continuous Integration Pipeline was used to show how the app would not only be designed but also developed and deployed to the user in an automated process

Shown below is the CI Pipeline for deployment of the Pet Clinic Application:

![groupcidiagram](https://user-images.githubusercontent.com/48153566/124000029-117e2400-d9cb-11eb-874d-0104c58174d3.png)



# Architecture

Reasons why we have chosen to use **Jenkins** over Azure Dev Ops for Pipeline:
•	Jenkins is open source, easy to install and it is ‘FREE’ to use
•	Jenkins contains a wide variety of plugins to use for automation
•	Jenkins is available for all platforms; Windows, Linux & Mac OS
•	Microsoft Azure DevOps has a difficult integration process with non-Microsoft products
•	Azure Pipeline is very straightforward which makes it difficult to develop complex workflows


Reasons why we have chosen **Terraform** over Ansible:
•	Terraform allows for Orchestration as well as deployment
•	Terraform can efficiently perform build, version and alter the infrastructure.
•	Terraform supports multiple providers. Thus, users can handle multi-cloud environments in the same language
•	Terraform consists of a command-line interface that can provide infrastructure in a simple code
•	Terraform also allows for deployment of load balancers as required for this project

Reasons why we have chosen **Kubernetes** over Docker Swarm:
•	Shows error logs and information on state of cluster resources allowing for efficient troubleshooting
•	Kubernetes supports autoscaling on Cluster and Pod level 
•	Although Docker swarm is easy to get started with, Kubernetes supports higher demands with more complexity


# Front End Design

Below is an image showcasing an example of the front end of the application


# Back End Design

Below is an image showcasing an example of the back end of the application


# Authors

Goke Tegbe
Henil Soni
Abs Pinnakoh-Morrison
Thomas Holmes
William Denington
