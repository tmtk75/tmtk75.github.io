#!/usr/bin/env ruby

path = ARGV[0]

open(path, "r") {|f|
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
             if a.last.last == nil
               a.last << b
             elsif a.last.last == b
               a.last << b
             else
               a << [b]
             end
             a
           }
  p words
}
