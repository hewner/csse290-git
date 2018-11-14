#!/usr/bin/ruby
require 'optparse'

# parse some command line options
tree_sha = nil
search_term = nil
OptionParser.new do |opts|
  opts.on("-t TREE", "--tree TREE", "SHA of tree we want to visualize") do |val|
    tree_sha = val
  end
  opts.on("-s SEARCH_TERM", "--search-term SEARCH_TERM", "path to search for") do |val|
    search_term = val
  end
end.parse(ARGV)
raise "You must specify a tree (-t)" if tree_sha.nil?
raise "You must specify something to search for (-s)" if search_term.nil?

# just an example that shows you how to invoke/parse command results
bigstring = `ls -latr`
lines = bigstring.split("\n")
lines.each do |line|
  columns = line.split(" ")
  puts columns[0] # just print out file permission info
end
