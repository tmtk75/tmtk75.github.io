---
layout: post
title: EC2 Instance Types
creation-date: 2012-09-07  6:56:19
---
Standard Instances
Instances of this family are well suited for most applications.

<table>
<tr>
  <td>Small Instance – default++</td>
  <td>Medium Instance</td>
<td>Large Instance</td>
<td>Extra Large Instance</td>
</tr>
<tr>
  <td>
1.7 GB memory
1 EC2 Compute Unit (1 virtual core with 1 EC2 Compute Unit)
160 GB instance storage
32-bit or 64-bit platform
I/O Performance: Moderate
EBS-Optimized Available: No
API name: m1.small
</td>
<td>
3.75 GB memory
2 EC2 Compute Unit (1 virtual core with 2 EC2 Compute Unit)
410 GB instance storage
32-bit or 64-bit platform
I/O Performance: Moderate
EBS-Optimized Available: No
API name: m1.medium
</td>
<td>
7.5 GB memory
4 EC2 Compute Units (2 virtual cores with 2 EC2 Compute Units each)
850 GB instance storage
64-bit platform
I/O Performance: High
EBS-Optimized Available: 500 Mbps
API name: m1.large
</td>
<td>
15 GB memory
8 EC2 Compute Units (4 virtual cores with 2 EC2 Compute Units each)
1,690 GB instance storage
64-bit platform
I/O Performance: High
EBS-Optimized Available: 1000 Mbps
API name: m1.xlarge
Micro Instances
</td>
</tr>
</table>

Micro instances (t1.micro) provide a small amount of consistent CPU resources and allow you to increase CPU capacity in short bursts when additional cycles are available. They are well suited for lower throughput applications and web sites that require additional compute cycles periodically. You can learn more about how you can use Micro instances and appropriate applications in the Amazon EC2 documentation
Micro Instance
613 MB memory

Up to 2 EC2 Compute Units (for short periodic bursts)

EBS storage only

32-bit or 64-bit platform

I/O Performance: Low

EBS-Optimized Available: No

API name: t1.micro



High-Memory Instances


Instances of this family offer large memory sizes for high throughput applications, including database and memory caching applications.
High-Memory Extra Large Instance
17.1 GB of memory

6.5 EC2 Compute Units (2 virtual cores with 3.25 EC2 Compute Units each)

420 GB of instance storage

64-bit platform

I/O Performance: Moderate

EBS-Optimized Available: No

API name: m2.xlarge


High-Memory Double Extra Large Instance
34.2 GB of memory

13 EC2 Compute Units (4 virtual cores with 3.25 EC2 Compute Units each)

850 GB of instance storage

64-bit platform

I/O Performance: High

EBS-Optimized Available: No

API name: m2.2xlarge


High-Memory Quadruple Extra Large Instance
68.4 GB of memory

26 EC2 Compute Units (8 virtual cores with 3.25 EC2 Compute Units each)

1690 GB of instance storage

64-bit platform

I/O Performance: High

EBS-Optimized Available: 1000 Mbps

API name: m2.4xlarge


High-CPU Instances


Instances of this family have proportionally more CPU resources than memory (RAM) and are well suited for compute-intensive applications.
High-CPU Medium Instance
1.7 GB of memory

5 EC2 Compute Units (2 virtual cores with 2.5 EC2 Compute Units each)

350 GB of instance storage

32-bit or 64-bit platform

I/O Performance: Moderate

EBS-Optimized Available: No

API name: c1.medium


High-CPU Extra Large Instance
7 GB of memory

20 EC2 Compute Units (8 virtual cores with 2.5 EC2 Compute Units each)

1690 GB of instance storage

64-bit platform

I/O Performance: High

EBS-Optimized Available: No

API name: c1.xlarge


Cluster Compute Instances


Instances of this family provide proportionally high CPU resources with increased network performance and are well suited for High Performance Compute (HPC) applications and other demanding network-bound applications. You can learn more about Cluster instance concepts by reading the Amazon EC2 documentation. For more information about specific use cases and cluster management options for HPC, please visit the HPC solutions page.

Cluster Compute Quadruple Extra Large Instance
23 GB of memory

33.5 EC2 Compute Units (2 x Intel Xeon X5570, quad-core “Nehalem” architecture)

1690 GB of instance storage

64-bit platform

I/O Performance: Very High (10 Gigabit Ethernet)

EBS-Optimized Available: No*

API name: cc1.4xlarge



*Cluster Compute, Cluster GPU and High I/O instances do not currently support EBS Optimization, but provide customers with high bandwidth networking and can also be used with EBS Provisioned IOPS volumes for improved consistency and performance.

Cluster Compute Eight Extra Large Instance
60.5 GB of memory

88 EC2 Compute Units (2 x Intel Xeon E5-2670, eight-core "Sandy Bridge" architecture)

3370 GB of instance storage

64-bit platform

I/O Performance: Very High (10 Gigabit Ethernet)

EBS-Optimized Available: No*

API name: cc2.8xlarge



*Cluster Compute, Cluster GPU and High I/O instances do not currently support EBS Optimization, but provide customers with high bandwidth networking and can also be used with EBS Provisioned IOPS volumes for improved consistency and performance.

Cluster GPU Instances


Instances of this family provide general-purpose graphics processing units (GPUs) with proportionally high CPU and increased network performance for applications benefitting from highly parallelized processing, including HPC, rendering and media processing applications. While Cluster Compute Instances provide the ability to create clusters of instances connected by a low latency, high throughput network, Cluster GPU Instances provide an additional option for applications that can benefit from the efficiency gains of the parallel computing power of GPUs over what can be achieved with traditional processors. Learn more about use of this instance type for HPC applications.

Cluster GPU Quadruple Extra Large Instance
22 GB of memory

33.5 EC2 Compute Units (2 x Intel Xeon X5570, quad-core “Nehalem” architecture)

2 x NVIDIA Tesla “Fermi” M2050 GPUs

1690 GB of instance storage

64-bit platform

I/O Performance: Very High (10 Gigabit Ethernet)

EBS-Optimized Available: No*

API name: cg1.4xlarge



*Cluster Compute, Cluster GPU and High I/O instances do not currently support EBS Optimization, but provide customers with high bandwidth networking and can also be used with EBS Provisioned IOPS volumes for improved consistency and performance.

High I/O Instances


Instances of this family provide very high instance storage I/O performance and are ideally suited for many high performance database workloads. Example applications include NoSQL databases like Cassandra and MongoDB. High I/O instances are backed by Solid State Drives (SSD), and also provide high levels of CPU, memory and network performance.
High I/O Quadruple Extra Large Instance
60.5 GB of memory

35 EC2 Compute Units (16 virtual cores*)

2 SSD-based volumes each with 1024 GB of instance storage

64-bit platform

I/O Performance: Very High (10 Gigabit Ethernet)

Storage I/O Performance: Very High**

EBS-Optimized Available: No***

API name: hi1.4xlarge


*8 cores + 8 hyperthreads for 16 virtual cores 


**Using Linux paravirtual (PV) AMIs, High I/O Quadruple Extra Large instances can deliver more than 120,000 4 KB random read IOPS and between 10,000 and 85,000 4 KB random write IOPS (depending on active logical block addressing span) to applications. For hardware virtual machines (HVM) and Windows AMIs, performance is approximately 90,000 4 KB random read IOPS and between 9,000 and 75,000 4 KB random write IOPS. The maximum sequential throughput on all AMI types (Linux PV, Linux HVM, and Windows) per second is approximately 2 GB read and 1.1 GB write. 


For customers using Microsoft Windows Server, High I/O Instances are only supported with the Microsoft Windows Server AMIs for Cluster Instance Type.
***Cluster Compute, Cluster GPU and High I/O instances do not currently support EBS Optimization, but provide customers with high bandwidth networking and can also be used with EBS Provisioned IOPS volumes for improved consistency and performance.

:1

