task :default => [:stylus, :tags]

desc "Given a title as an argument, create a new post file."
task :post, [:title] do |t, args|
  filename = "#{Time.now.strftime '%Y-%m-%d'}-#{args.title.gsub(/\s/, '_').downcase}.md"
  now = Time.now.to_s
  path = File.join "_posts", filename
  if File.exist? path then raise "Won't clobber #{path}" end
  File.open(path, 'w') do |file|
    file.write <<EOF
---
layout: post
title: #{args.title}
tags:
lang: #{args.lang}
creation-date: #{now}
modified-date: #{now}
---
EOF
    end
  system "#{ENV['EDITOR']} #{path}"
end

desc "compile *.styl"
task :stylus do
  require "stylus"
  Dir.glob("assets/css/*.styl").each {|path|
    basename = (File.basename path, ".styl")
    dirname = (File.dirname path)
    open("#{dirname}/#{basename}.css", "w") {|f| f << Stylus.compile(File.new(path))}
  }
end

desc "make tags"
task :tags do |t, args|
  #!/usr/bin/env ruby
  require "json"
  require "fileutils"
  tags = {"en"=>Hash.new([]), "ja"=>Hash.new([])}
  Dir.glob("_posts/**").map {|path|
    lines = open(path, "r") {|f| f.readlines}
    title     = lines.find {|e| e =~ /^title:/}.gsub(/^title:/, "").strip
    lang      = (lines.find {|e| e =~ /^lang:/} or "en").gsub(/^lang:/, "").strip
    tags_line = lines.find {|e| e =~ /^tags:/}
    next unless tags_line =~ /^tags:(.*)$/
    $1.strip.split(/ +/).each {|e|
      p = path.gsub(/^_posts/, "")
              .gsub(/(....)-(..)-(..)-/, "\\1/\\2/\\3/")
              .gsub(/\.md/, ".html")
      lang = "en" if lang.empty?
      tags[lang][e.downcase] += [{path: p, title: title}]
    }
  }
  puts tags.to_json
  #puts JSON.pretty_generate tags
end

