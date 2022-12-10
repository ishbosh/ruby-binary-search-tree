require_relative 'lib/tree'

# Driver Script
puts 'Initializing tree...'
array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)
puts tree.pretty_print

puts "\nBalanced?: #{tree.balanced?}"
puts "\nLevel Order:"
p tree.level_order
puts 'Level Order Recursive:'
p tree.level_order_rec
puts "\nPreorder:"
p tree.preorder
puts "\nPostorder:"
p tree.postorder
puts "\nInorder:"
p tree.inorder
puts "\nAdding 125: #{tree.insert(125)}"
puts "Adding 133: #{tree.insert(133)}"
puts "Adding 200: #{tree.insert(200)}"
puts "Adding 201: #{tree.insert(201)}"
puts "\nUpdated Tree:"
puts tree.pretty_print
puts "\nBalanced?: #{tree.balanced?}"
puts "\nRebalancing..."
tree.rebalance
puts "\nUpdated Tree:"
puts tree.pretty_print
puts "\nBalanced?: #{tree.balanced?}"
puts "\nLevel Order:"
p tree.level_order
puts 'Level Order Recursive:'
p tree.level_order_rec
puts "\nPreorder:"
p tree.preorder
puts "\nPostorder:"
p tree.postorder
puts "\nInorder:"
p tree.inorder