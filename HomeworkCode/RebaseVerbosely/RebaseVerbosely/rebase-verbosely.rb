#!/usr/bin/ruby
require 'optparse'

def do_thing(line)
  puts line
  system(line)
end

new_base = nil
OptionParser.new do |opts|
  opts.on("-b BASE", "--base BASE", "New base to rebase to") do |val|
    new_base = val
  end
end.parse(ARGV)
raise "You must specify a new base (-b)" if new_base.nil?
