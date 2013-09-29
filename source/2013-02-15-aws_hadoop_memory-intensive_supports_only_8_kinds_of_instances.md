---
layout: post
title: AWS Hadoop Memory-Intensive supports only 8 kinds of instances
tags: AWS, hadoop, EMR
lang: 
creation-date: 2013-02-15 08:11:43 +0900
modified-date: 2013-02-15 08:11:43 +0900
---

According to [instance-types.html][availabletypes],
at Feb 12, 2013, we can use 18 instance types.

On [AWS EMR][EMR], we can specify any types using the SDK or REST API.
Then AWS provides a configuration script for memory.
It's hemory-intensive and there is [a description for it][memoryintensive] here.
That script configures the properties of Hadoop for memory based on the instance type you selected,
however, then you use only **8 types** if you use the script according to the description.

There are next types:

    m1.small
    m1.large
    m1.xlarge
    c1.medium
    c1.xlarge
    m2.xlarge
    m2.2xlarge
    m2.4xlarge

If you set up memory-intensive in bootstrap actions of EMR and use types which it doesn't support,
The job flow you kicked must be failed at memory-intensive step.

A few days ago, I didn't know that. I tried to use m1.medium,
it was failed and I wasted lots of time to check the cause :(

Take care of this!

|-------------+---------------------------|
| type        | memory-intensive support? |
|-------------|---------------------------|
| m1.small    | YES |
| m1.medium   | NO  |
| m1.large    | YES |
| m1.xlarge   | YES |
| c1.medium   | YES |
| c1.xlarge   | YES |
| m2.xlarge   | YES |
| m2.2xlarge  | YES |
| m2.4xlarge  | YES |
| cc1.4xlarge | NO  |
| cc2.8xlarge | NO  |
| cg1.4xlarge | NO  |
| cr1.8xlarge | NO  |
| hi1.4xlarge | NO  |
| hs1.8xlarge | NO  |
| m3.xlarge   | NO  |
| m3.2xlarge  | NO  |
| t1.micro    | NO  |
|-------------|-----|
{:.table .table-condensed}

  [availabletypes]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes
  [memoryintensive]: http://docs.aws.amazon.com/ElasticMapReduce/latest/DeveloperGuide/HadoopMemoryIntensive.html
  [EMR]: http://aws.amazon.com/jp/elasticmapreduce/

