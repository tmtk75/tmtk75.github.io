

path = ARGV[0]

open(path, "r") {|f|
  p f.read.gsub(/---.*?---/m, "").split("\n")
  #.split(" +")
}
