require_relative 'lib/tree'

array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)

puts "Balanced?: #{tree.balanced?}"
puts 'Level Order:'
puts tree.level_order
puts 'Level Order Recursive:'
puts tree.level_order_rec