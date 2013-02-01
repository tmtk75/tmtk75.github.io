---
layout: post
title: Set up chef-server on EC2 with Ubuntu 12.04
tags: chef installation aws ec2 ubuntu
creation-date: 2013-02-01  8:33:03
---
This post says very useful instruction if you'd like to set up a chef-server on Amazon EC2.
Providing all steps to the installation. Check it out.

This instruction is based on:

- You already have your AWS account and signed up EC2
- Using Ubuntu Server 12.04.1 LTS provided by AWS
- Instance type is t1.micro
- Just launching chef-server with webui


Launching an EC2 instance
-------------------------

<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-10.png'>
<!-- img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-1.png' -->
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-2.png'>
<!-- img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-3.png' -->
<!-- img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-4.png' -->
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-5.png'>
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-6.png'>
<!-- img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-7.png' -->
<!-- img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-8.png' -->
<img width='460px' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-02-01/EC2+Management+Console-9.png'>


Install chef-server
-------------------
