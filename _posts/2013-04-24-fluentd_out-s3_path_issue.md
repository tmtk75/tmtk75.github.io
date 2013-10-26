---
layout: redirect
title: My stuck point for fluent-plugin-s3 configuration
tags: fluentd s3 plugin
lang: 
creation-date: 2013-04-24 14:51:53 +0900
modified-date: 2013-04-24 14:51:53 +0900
---
## Why not uploaded?
I was really stuck in configuration of fluent-plugin-s3. (Actually, the plugin is not responsible for this. I'll write later)

This is an out-plugin for fluentd in order to upload to S3.
The match configuration requires some parameters to access S3 and the path.
They are AWS access key id, secret key, bucket name, endpoint and so on.

Here is an example for it, <https://github.com/fluent/fluent-plugin-s3#configuration>

BTW, I configured it and started fluentd, but it seemed no logs would be uploaded to S3.
I was wondering if it's not been uploaded.
It was very simple mistake for `path` parameter.

At first, I configured like this.

```
s3_object_key_format %{path}%{time_slice}_%{index}.%{file_extension}
path /tmp/logs
```

This never had worked.

Actually, I had to write like

```
path tmp/logs
```

It seems that we must not start with `/`. Mh...

## aws-sdk gem
The plugin uses [aws-sdk](git@github.com:aws/aws-sdk-ruby.git) like [this](https://github.com/fluent/fluent-plugin-s3/blob/f66762758c8c38b1e87ebbbad8571f9f25ff07f5/lib/fluent/plugin/out_s3.rb#L10).
I checked the behavior. The version of aws-sdk is 1.9.1 provided by rubygems.

```ruby
## path-test.rb
require "aws-sdk"
bucket = AWS::S3.new.buckets["s3://example.com"]
obj  bucket.objects["/tmpfile"]
p obj 
```

```
$ ruby path-test.rb
<AWS::S3::S3Object:s3://example.com//tmpfile>
```

I tried to create a new object at `/tmpfile`, but it didn't work.
This issue depends on `aws-sdk`.

Don't forget removing `/` at head!
