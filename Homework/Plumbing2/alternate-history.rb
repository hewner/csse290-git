#!/usr/bin/ruby
require 'optparse'

trees = []
output = nil
OptionParser.new do |opts|
  opts.on("-t TREE", "--tree TREE", "SHA of tree to include in history") do |val|
    trees << val
  end
  opts.on("-o OUTPUT_BRANCH", "--output OUTPUT_BRANCH", "branch that contains alternative history") do |val|
    output = val
  end
end.parse(ARGV)
raise "You must specify a tree (-t)" if trees.empty?
raise "You must an output branch" if output.nil?

# your code here
