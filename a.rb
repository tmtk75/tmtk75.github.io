#!/usr/bin/env ruby
require "pp"

path = ARGV[0]
f = $stdin

words = f.read
         .gsub(/---.*?---/m, "")
         .split(/ |\n/)
         .map {|e| e.gsub /[^a-zA-Z0-9_\-]/, "-"}
         .map {|e| e.gsub /-+/, "-"}
         .map {|e| e.gsub /^-|-$/, ""}
         .find_all {|e| e.length > 0}
         .sort
         .unshift([[]])
         .reduce {|a, b|
           if a.last.last == nil or a.last.last == b
             a.last << b
           else
             a << [b]
           end
           a
         }
         .map {|e| [e[0], e.length]}
pp words.find_all {|e| e[1] > 2 and e[0].length >= 3}
