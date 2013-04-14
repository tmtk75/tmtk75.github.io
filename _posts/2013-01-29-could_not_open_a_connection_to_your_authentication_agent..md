---
layout: post
title: Could not open a connection to your authentication agent.
tags: sshd ssh-agent ssh-add
creation-date: 2013-01-29 11:59:03
---

If you ran into a message "Could not open a connection to your authentication agent." when type ssh-add,
it must be that you don't have settings for ssh-agent.

```bash
$ ssh-agent
SSH_AUTH_SOCK=/var/folders/sx/5z2568ss68997plzhw6qympw0000gn/T//ssh-9ikR207fRO4n/agent.64887; export SSH_AUTH_SOCK;
SSH_AGENT_PID=64888; export SSH_AGENT_PID;
echo Agent pid 64888;
```

Then you have to set it up.
If you type `ssh-agent`, it prints like the above.

```bash
$ eval `ssh-agent`
$ ssh-add
Identity added: /your/home/.ssh/id_rsa (/your/home/.ssh/id_rsa)
```

You can evaluate the output.
That worked, great.
