#!/usr/bin/ruby
require 'optparse'

use_commit = nil
comment_commit = nil
branch = nil
prefix = nil

OptionParser.new do |opts|
  opts.on("-u COMMIT", "--use COMMIT", "SHA of commit we want to actually use for conflicts") do |val|
    use_commit = val
  end
  opts.on("-c COMMIT", "--commentify COMMIT", "SHA of commit we want to turn into comments for conflicts") do |val|
    comment_commit = val
  end

    opts.on("-b BRANCH", "--branch BRANCH", "name of a branch we create to hold the output") do |val|
    branch = val
  end

    opts.on("-p STRING", "--prefix STRING", "prefix to append to comments") do |val|
    prefix = val
  end


end.parse(ARGV)
raise "missing parameter" if [use_commit,comment_commit,branch,prefix].include? nil

# handy function for debugging.  It runs a command line command, but
# prints it first so you know what happened if it causes an error.
def do_thing(line)
  puts line
  system(line)
end

# as it stands, this function just copies a file to a temp location.
# But maybe you can figure out something cooler for it to do.
def handle_file(name)
  File.open("/tmp/myfile",'w') do |output|
    File.foreach(name) do |line|
      output.write(line)
    end
  end
end

# your code here and above!
