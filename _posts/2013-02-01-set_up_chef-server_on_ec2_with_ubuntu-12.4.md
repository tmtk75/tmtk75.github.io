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
<img width='460px' src='{{site.images.url}}/2013-02-01/EC2+Management+Console-10.png'>

Next, choose "Ubuntu Server 12.04.1 LTS" and click "Select" button.
You should choose 64bit for the architecture.
<img width='460px' src='{{site.images.url}}/2013-02-01/EC2+Management+Console-2.png'>

You will see the diagram to create a keypair.
I recommend you create a new one. If you create, your browser download the private key, which is `chefamikey.pem` here.
It's needed to log in the instance you are launching, so you have to keep it.
<img width='460px' src='{{site.images.url}}/2013-02-01/EC2+Management+Console-5.png'>

And also you should create a new security group which is for opening some TCP ports.
You need three ports like 22(ssh), 4000(chef REST API), 4040(chef webui).
You input each number in "Port range" and click "Add Rule" button.
<img width='460px' src='{{site.images.url}}/2013-02-01/EC2+Management+Console-6.png'>

This rules are change at `Security Group` pane whenever you want after this wizard.
Don't worry.
<img width='460px' src='{{site.images.url}}/2013-02-01/EC2+Management+Console-9.png'>


Install chef-server
-------------------
You have launched an EC2 instance for chef-server.  
OK, let's install there actually.

- Log-in thru ssh with the private key
- Install some native libraries and ruby with apt-get
- Download two chef's configuration files
- Install chef-solr with gem
- Install chef-server with chef-solo


<p style='margin-top:3em;'>
You already have a private key. Please try to log-in with it like this.
The file permission of it is required as 400, which is read only for owner.
Replace the path with yours.
</p>

    chmod 400 ~/Downloads/chefamikey.pem
    ssh -i ~/Downloads/chefamikey.pem ubuntu@ec2-54-248-3-36.ap-northeast-1.compute.amazonaws.com


Next, some native libraries are installed.
Here is ruby1.9.3, but you can search other version with aptitude.

    sudo apt-get install libstdc++6-4.6-dev g++ make
    aptitude search ^ruby1.9
    sudo apt-get install ruby1.9.3
{:.terminal}


<p style='margin-top:3em;'></p>
Next, let's download chef's configuration files from my gist, [solo.rb][solo] and [chef.json][chef.json].
They are same files with the file at my former post
[How to install chef server on ubuntu-11.10 using apt-get](/2012/05/02/chef_server_installation_on_ubuntu-11.10.html).

    wget -O ~/solo.rb https://gist.github.com/raw/2600816/fb2af218c4c31695504dbddccbbcbe582e994c71/gistfile1.txt
    wget -O ~/chef.json https://gist.github.com/raw/2600821/74c7a4b362cb5437ee6de7688ba2710c5a08b8a6/gistfile1.txt
{:.terminal}

  [solo]: https://gist.github.com/2600816
  [chef.json]: https://gist.github.com/2600821


Install chef-solr with gem, which is a required component by chef-server.
If you see the logs like below, it's succeeded.

    sudo gem install zliby chef-solr --no-ri --no-rdoc
    ...
    Successfully installed chef-10.18.2
    Successfully installed chef-solr-10.18.2
    19 gems installed
{:.terminal}


<p style='margin-top:3em;'>
Finally, you finished preparing the kick of installation for chef-server.
Type the first line and enter.
</p>

    sudo chef-solo -c ~/solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
    [2013-01-30T23:58:07+00:00] INFO: *** Chef 10.18.2 ***
    ...
    [2013-01-31T00:07:15+00:00] INFO: Chef Run complete in 546.573833984 seconds
    [2013-01-31T00:07:15+00:00] INFO: Running report handlers
    [2013-01-31T00:07:15+00:00] INFO: Report handlers complete
{:.terminal}

When you see `Report handlers complete` at the last, congraturation!
It took about 10 minutes on t1.micro instance.


<p style='margin-top:3em;'></p>
Now, you got a new chef-server and can access with the webui.  
Let's open with your browser to a URL like `http://ec2-54-248-3-36.ap-northeast-1.compute.amazonaws.com:4040` thru 4040 port.

You can see a login page of chef-server-webui.
Then, you have to change admin password because the initial password is `p@ssw0rd`.

Enjoy chef!
