---
layout: redirect
title: How to change endpoint of EMR with aws-sdk 1.6.5
creation-date: 2012-09-07 14:24:11
---
Amazon Elastic Mapreduce is available in Japan and other regions apart from US region,
but Ruby aws-sdk 1.6.5 doesn't support those regions.

Here is a workaround in case of Japan region.

```ruby
AWS::Core::Configuration.module_eval do
  add_service 'EMR', 'emr', 'ap-northeast-1.elasticmapreduce.amazonaws.com'
end
```
