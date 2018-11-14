#!/usr/bin/ruby
require 'optparse'

def do_thing(line)
  puts line
  system(line)
end

remote = nil
OptionParser.new do |opts|
  opts.on("-r REMOTE", "--remote REMOTE", "specification of remote repo") do |val|
    remote = val
  end
end.parse(ARGV)
raise "You must specify a new remote (-r)" if remote.nil?
