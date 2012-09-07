---
layout: post
title: EC2 Instance Types (table format)
creation-date: 2012-09-07  6:56:19
---
It's little hard to compare instance type with the [original page](https://aws.amazon.com/ec2/instance-types/).
I format as to be comparable using table. This information is quoted based on the page at 2012/09/07.

Standard Instances
------------------
Instances of this family are well suited for most applications.
<style>
table.ec2-instance-type thead {border-bottom: 2px solid #888;}
.ec2-instance-type ul {list-style:none; margin-left:0px}
article#the.post p:not(:first-child) {margin-top: auto;}
</style>
<table class="ec2-instance-type" width="1000px">
<thead>
<tr>
  <th>Small Instance – default++</th>
  <th>Medium Instance</th>
  <th>Large Instance</th>
  <th>Extra Large Instance</th>
</tr>
</thead>
<tbody>
<tr>
  <td>
  <ul>
  <li>1.7 GB memory</li>
  <li>1 EC2 Compute Unit (1 virtual core with 1 EC2 Compute Unit)</li>
  <li>160 GB instance storage</li>
  <li>32-bit or 64-bit platform</li>
  <li>I/O Performance: Moderate</li>
  <li>EBS-Optimized Available: No</li>
  <li>API name: m1.small</li>
  </ul>
  </td>
  <td>
  <ul>
  <li>3.75 GB memory</li>
  <li>2 EC2 Compute Unit (1 virtual core with 2 EC2 Compute Unit)</li>
  <li>410 GB instance storage</li>
  <li>32-bit or 64-bit platform</li>
  <li>I/O Performance: Moderate</li>
  <li>EBS-Optimized Available: No</li>
  <li>API name: m1.medium</li>
  </ul>
  </td>
  <td>
  <ul>
  <li>7.5 GB memory</li>
  <li>4 EC2 Compute Units (2 virtual cores with 2 EC2 Compute Units each)</li>
  <li>850 GB instance storage</li>
  <li>64-bit platform</li>
  <li>I/O Performance: High</li>
  <li>EBS-Optimized Available: 500 Mbps</li>
  <li>API name: m1.large</li>
  </ul>
  </td>
  <td>
  <ul>
  <li>15 GB memory</li>
  <li>8 EC2 Compute Units (4 virtual cores with 2 EC2 Compute Units each)</li>
  <li>1,690 GB instance storage</li>
  <li>64-bit platform</li>
  <li>I/O Performance: High</li>
  <li>EBS-Optimized Available: 1000 Mbps</li>
  <li>API name: m1.xlarge</li>
  </ul>
  </td>
</tr>
</tbody>
</table>

Micro Instances
---------------
<table class="ec2-instance-type">
<thead><tr><th>Micro Instance</th></tr></thead>
<tbody><tr><td>
<ul>
<li>613 MB memory</li>
<li>Up to 2 EC2 Compute Units (for short periodic bursts)</li>
<li>EBS storage only</li>
<li>32-bit or 64-bit platform</li>
<li>I/O Performance: Low</li>
<li>EBS-Optimized Available: No</li>
<li>API name: t1.micro</li>
</ul></td></tr></tbody>
</table>

Micro instances (t1.micro) provide a small amount of consistent CPU resources and allow you to increase CPU capacity in short bursts when additional cycles are available. They are well suited for lower throughput applications and web sites that require additional compute cycles periodically. You can learn more about how you can use Micro instances and appropriate applications in the Amazon EC2 documentation


High-Memory Instances
---------------------
Instances of this family offer large memory sizes for high throughput applications, including database and memory caching applications.

<table class="ec2-instance-type" width="750px">
<thead>
  <tr><th>High-Memory Extra Large Instance</th>
 <th>High-Memory Double Extra Large Instance</th>
  <th>High-Memory Quadruple Extra Large Instance</th></tr>
</thead>
<tbody><tr><td><ul>
<li>17.1 GB of memory</li>
<li>6.5 EC2 Compute Units (2 virtual cores with 3.25 EC2 Compute Units each)</li>
<li>420 GB of instance storage</li>
<li>64-bit platform</li>
<li>I/O Performance: Moderate</li>
<li>EBS-Optimized Available: No</li>
<li>API name: m2.xlarge</li></ul>
</td>
<td><ul>
<li>34.2 GB of memory</li>
<li>13 EC2 Compute Units (4 virtual cores with 3.25 EC2 Compute Units each)</li>
<li>850 GB of instance storage</li>
<li>64-bit platform</li>
<li>I/O Performance: High</li>
<li>EBS-Optimized Available: No</li>
<li>API name: m2.2xlarge</li></ul>
</td>
<td><ul>
<li>68.4 GB of memory</li>
<li>26 EC2 Compute Units (8 virtual cores with 3.25 EC2 Compute Units each)</li>
<li>1690 GB of instance storage</li>
<li>64-bit platform</li>
<li>I/O Performance: High</li>
<li>EBS-Optimized Available: 1000 Mbps</li>
<li>API name: m2.4xlarge</li></ul>
</td>
</tr></tbody></table>

High-CPU Instances
------------------
Instances of this family have proportionally more CPU resources than memory (RAM) and are well suited for compute-intensive applications.

<table class="ec2-instance-type">
<thead>
  <tr><th>High-CPU Medium Instanc</th>
  <th>High-CPU Extra Large Instance</th></tr>
  </thead>
  <tbody>
  <tr><td><ul>
<li>1.7 GB of memory</li>
<li>5 EC2 Compute Units (2 virtual cores with 2.5 EC2 Compute Units each)</li>
<li>350 GB of instance storage</li>
<li>32-bit or 64-bit platform</li>
<li>I/O Performance: Moderate</li>
<li>EBS-Optimized Available: No</li>
<li>API name: c1.medium</li></ul>
</td>
<td><ul>
<li>7 GB of memory</li>
<li>20 EC2 Compute Units (8 virtual cores with 2.5 EC2 Compute Units each)</li>
<li>1690 GB of instance storage</li>
<li>64-bit platform</li>
<li>I/O Performance: High</li>
<li>EBS-Optimized Available: No</li>
<li>API name: c1.xlarge</li></ul>
</td></tr></tbody></table>

Cluster Compute Instances
-------------------------
Instances of this family provide proportionally high CPU resources with increased network performance and are well suited for High Performance Compute (HPC) applications and other demanding network-bound applications. You can learn more about Cluster instance concepts by reading the Amazon EC2 documentation. For more information about specific use cases and cluster management options for HPC, please visit the HPC solutions page.

<table class="ec2-instance-type">
<thead>
  <tr><th>Cluster Compute Quadruple Extra Large Instance</th>
  <th>Cluster Compute Eight Extra Large Instance</th> </tr>
  </thead>
<tbody>
<tr><td><ul>
<li>23 GB of memory</li>
<li>33.5 EC2 Compute Units (2 x Intel Xeon X5570, quad-core “Nehalem” architecture)</li>
<li>1690 GB of instance storage</li>
<li>64-bit platform</li>
<li>I/O Performance: Very High (10 Gigabit Ethernet)</li>
<li>EBS-Optimized Available: No</li>
<li>API name: cc1.4xlarge</li>
</ul></td><td><ul>
<li>60.5 GB of memory</li>
<li>88 EC2 Compute Units (2 x Intel Xeon E5-2670, eight-core "Sandy Bridge" architecture)</li>
<li>3370 GB of instance storage</li>
<li>64-bit platform</li>
<li>I/O Performance: Very High (10 Gigabit Ethernet)</li>
<li>EBS-Optimized Available: No</li>
<li>API name: cc2.8xlarge</li>
</ul></td></tr></tbody>
</table>

Cluster Compute, Cluster GPU and High I/O instances do not currently support EBS Optimization, but provide customers with high bandwidth networking and can also be used with EBS Provisioned IOPS volumes for improved consistency and performance.

Cluster GPU Instances
---------------------
Instances of this family provide general-purpose graphics processing units (GPUs) with proportionally high CPU and increased network performance for applications benefitting from highly parallelized processing, including HPC, rendering and media processing applications. While Cluster Compute Instances provide the ability to create clusters of instances connected by a low latency, high throughput network, Cluster GPU Instances provide an additional option for applications that can benefit from the efficiency gains of the parallel computing power of GPUs over what can be achieved with traditional processors. Learn more about use of this instance type for HPC applications.

<table class="ec2-instance-type">
<thead>
  <tr><th>Cluster GPU Quadruple Extra Large Instance</th></tr>
  </thead>
<tbody>
<tr><td><ul>
<li>22 GB of memory</li>
<li>33.5 EC2 Compute Units (2 x Intel Xeon X5570, quad-core “Nehalem” architecture)</li>
<li>2 x NVIDIA Tesla “Fermi” M2050 GPUs</li>
<li>1690 GB of instance storage</li>
<li>64-bit platform</li>
<li>I/O Performance: Very High (10 Gigabit Ethernet)</li>
<li>EBS-Optimized Available: No</li>
<li>API name: cg1.4xlarge</li>
</ul></td></tr></tbody>
</table>

Cluster Compute, Cluster GPU and High I/O instances do not currently support EBS Optimization, but provide customers with high bandwidth networking and can also be used with EBS Provisioned IOPS volumes for improved consistency and performance.

High I/O Instances
------------------
Instances of this family provide very high instance storage I/O performance and are ideally suited for many high performance database workloads. Example applications include NoSQL databases like Cassandra and MongoDB. High I/O instances are backed by Solid State Drives (SSD), and also provide high levels of CPU, memory and network performance.

<table class="ec2-instance-type">
<thead>
  <tr><th>High I/O Quadruple Extra Large Instance</th></tr>
  </thead>
<tbody>
<tr><td><ul>
<li>60.5 GB of memory</li>
<li>35 EC2 Compute Units (16 virtual cores)</li>
<li>2 SSD-based volumes each with 1024 GB of instance storage</li>
<li>64-bit platform</li>
<li>I/O Performance: Very High (10 Gigabit Ethernet)</li>
<li>Storage I/O Performance: Very High</li>
<li>EBS-Optimized Available: No</li>
<li>API name: hi1.4xlarge</li>
</ul></td></tr></tbody>
</table>


8 cores + 8 hyperthreads for 16 virtual cores 

Using Linux paravirtual (PV) AMIs, High I/O Quadruple Extra Large instances can deliver more than 120,000 4 KB random read IOPS and between 10,000 and 85,000 4 KB random write IOPS (depending on active logical block addressing span) to applications. For hardware virtual machines (HVM) and Windows AMIs, performance is approximately 90,000 4 KB random read IOPS and between 9,000 and 75,000 4 KB random write IOPS. The maximum sequential throughput on all AMI types (Linux PV, Linux HVM, and Windows) per second is approximately 2 GB read and 1.1 GB write. 

For customers using Microsoft Windows Server, High I/O Instances are only supported with the Microsoft Windows Server AMIs for Cluster Instance Type.
Cluster Compute, Cluster GPU and High I/O instances do not currently support EBS Optimization, but provide customers with high bandwidth networking and can also be used with EBS Provisioned IOPS volumes for improved consistency and performance.


