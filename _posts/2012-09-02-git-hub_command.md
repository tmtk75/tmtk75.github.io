---
layout: post
title: git-hub command
creation-date: 2012-09-02 21:35:02
---
It's not useful to open a file you wish on [github.com](http://github.com) through web browser from the top page of repository.
You have to click and click so much.

[git-hub](http://github.com/tmtk75/git-hub) sub command decreases the efforts, and you can open page you wish on github.
Now it supports only MacOS X because of using "open" command.

<https://github.com/tmtk75/git-hub>

    usage: git hub [command] [args]

      git extension for github to open page

      blob      <path-pattern>[:index] [ref]
      commits   [ref]
      commit    <path-pattern>[:path-index][:ref-index]
      history
      compare   <to-ref> [base-ref]
      diff
      branches  
      tags
      graphs    [contributors|commit-activity|code-frequency|impact|punch-card]
      network

      ref can be hash string like "566b682d5b" or remote branch name.
      
      blob:                                          commits:
        git hub blob README                            git hub commits master
        git hub blob README:2                          git hub commit[s] 82a98bc
        git hub blob RELEASENOTE release-20120615    
        git hub blob LICENSE 566b68

      commit:                                        history:
        git hub commit git-hub                         alias of commit
        git hub commit README:2:3
        git hub commit pom.xml::3

      compare:                                       diff:
        git hub compare spike-branch                   alias of compare
        git hub compare spike-branch big-change
        git hub compare 8a98bc 82a98bc^

      branches:                                      tags:
        git hub branches                               git hub tags

      graphs:                                        network:
        git hub graphs                                 git hub network

