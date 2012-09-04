task :default => :jekyll

desc "Jekyll"
task :jekyll, [:haml] do
  `jekyll`
end

desc "Compile with haml."
task :haml do
  require "haml"
  Dir.glob("**/*.haml") do |e|
    open(e.gsub(/\.haml$/, ""), "w") do |f|
      lines = File.new(e).readlines
      s = lines.select {|e| e =~ /^-#.*/}.map {|e| e.gsub /^-#|\n$/, ''}.join("\n")
      f.write <<EOF if s.length > 0
---
#{s}
---
EOF
      f.write Haml::Engine.new(lines.join "\n").render
    end
  end
end

desc "Given a title as an argument, create a new post file."
task :post, [:title] do |t, args|
  filename = "#{Time.now.strftime '%Y-%m-%d'}-#{args.title.gsub(/\s/, '_').downcase}.md"
  path = File.join "_posts", filename
  if File.exist? path then raise "Won't clobber #{path}" end
  File.open(path, 'w') do |file|
    file.write <<EOF
---
layout: post
title: #{args.title}
creation-date: #{Time.now.strftime '%Y-%m-%d %k:%M:%S'}
---
EOF
    end
  system "#{ENV['EDITOR']} #{path}"
end
