---
layout: post
title: Set up chef-server on EC2 with Ubuntu 12.04
tags: chef installation aws ec2 ubuntu
creation-date: 2013-02-01  8:33:03
---
This post says very useful instruction
if you are a beginner for AWS EC2 or chef and you'd like to set up a chef-server on Amazon EC2.
Because this provides all steps to the installation.
Check it out.

This instruction is based on:

- You already have your AWS account and signed up EC2
- Using Ubuntu Server 12.04.1 LTS provided by AWS
- Instance type is t1.micro
- Just launching chef-server with webui


Launching an EC2 instance
-------------------------
Let's create a new instance.  
I describe key points for the creation. You can simply click "Continue" button for some dialogs which are not here.

Choose "classic wizard", which is default, and click "Continue".
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-10.png'>

Next, choose "Ubuntu Server 12.04.1 LTS" and click "Select" button.
You should choose 64bit for the architecture.
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-2.png'>

You will see the diagram to create a keypair.
I recommend you create a new one. If you create, your browser download the private key, which is `chefamikey.pem` here.
It's needed to log in the instance you are launching, so you have to keep it.
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-5.png'>

And also you should create a new security group which is for opening some TCP ports.
You need three ports like 22(ssh), 4000(chef REST API), 4040(chef webui).
You input each number in "Port range" and click "Add Rule" button.
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-6.png'>

This rules are change at `Security Group` pane whenever you want after this wizard.
Don't worry.
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-9.png'>


Install chef-server
-------------------
You have launched an EC2 instance for chef-server.  
OK, let's install there actually.

- Log-in thru ssh with the private key
- Install some native libraries and ruby with apt-get
- Download two chef's configuration files
- Install chef-solr with gem
- Install chef-server with chef-solo

