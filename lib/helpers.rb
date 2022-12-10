# frozen_string_literal: true

# Helper methods for Tree class
module TreeHelpers
  # Pretty print method to visualize binary search tree
  # rubocop:disable Style/OptionalBooleanParameter
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
  # rubocop:enable Style/OptionalBooleanParameter

  protected

  # helper method for level_order and level_order_rec
  def add_children_to_queue(queue, node)
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    queue
  end

  # helper method for delete
  def left_leaf_node(node)
    node = node.left until node.left.nil? || node.nil?
    node
  end
end
