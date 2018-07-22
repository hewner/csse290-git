require 'rugged'
require 'optparse'

tree_sha = nil
repo_path = nil
OptionParser.new do |opts|
  opts.on("-t TREE", "--tree TREE", "SHA of tree we want to visualize") do |val|
    tree_sha = val
  end
  opts.on("-r REPO_PATH", "--repo REPO_PATH", "path to the .git directory of the repo") do |val|
    repo_path = val
  end
end.parse(ARGV)
raise "You must specify a tree (-t)" if tree_sha.nil?
raise "You must specify a repo path (-r)" if repo_path.nil?

$repo = Rugged::Repository.new(repo_path)
tree = $repo.lookup(tree_sha)

def shorten(oid)
  '"' + oid[0..5] + '"'
end

def dump_tree(tree)
  tree.each { |e| puts shorten(tree.oid) + " -> " + shorten(e[:oid]) + ";" }
  tree.each_tree { |e| dump_tree($repo.lookup(e[:oid])) }
end

puts "digraph G {"

dump_tree(tree)

puts "}"
