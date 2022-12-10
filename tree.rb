# frozen_string_literal: true

require_relative 'node'

# Implements the class for Balanced Binary Search Trees
class Tree
  def initialize(array)
    @array = array.uniq.sort
    end_index = @array.length - 1
    start_index = 0
    @root = build_tree(@array, start_index, end_index)
  end

  def build_tree(array, start_index, end_index)
    return nil if start_index > end_index

    mid_index = (start_index + end_index) / 2
    root = Node.new(array[mid_index])
    root.left = build_tree(array, start_index, mid_index - 1)
    root.right = build_tree(array, mid_index + 1, end_index)
    root
  end

  def insert(data, root = @root)
    return root = Node.new(data) if root.nil?

    return root if root.data.eql?(data)

    root.left = insert(data, root.left) if data < root.data
    root.right = insert(data, root.right) if data > root.data
    root
  end

  def delete(data, root = @root)
    return root if root.nil?

    if data < root.data # go down left tree
      root.left = delete(data, root.left)
    elsif data > root.data # go down right tree
      root.right = delete(data, root.right)
    else # this is the node to delete
      return root = (root.left && root.right.nil? ? root.left : root.right) if root.left.nil? || root.right.nil?

      root.data = min_value(root.right)
      root.right = delete(root.data, root.right)
    end
    root
  end

  # helper method for delete
  def min_value(root)
    min = root.data
    until root.left.nil?
      min = root.left.data
      root = root.left
    end
    min
  end

  def find(data, root = @root)
    return root if root.nil? || root.data.eql?(data)

    return find(data, root.left) if data < root.data

    find(data, root.right)
  end

  # iterative level order method
  def level_order(root = @root)
    return if root.nil?

    array = []
    queue = [root]
    until queue.empty?
      queue << queue.first.left unless queue.first.left.nil?
      queue << queue.first.right unless queue.first.right.nil?
      yield queue.first if block_given?
      array << queue.shift.data
    end
    array unless block_given?
  end

  # recursive level order method
  def level_order_rec(root = @root, queue = [@root], array = [], &block)
    return if root.nil?

    block.call(queue.shift) if block_given?
    array << queue.shift.data
    queue << root.left unless root.left.nil?
    queue << root.right unless root.right.nil?
    level_order_rec(queue.first, queue, array, &block)
    array unless block_given?
  end

  # LDR
  def inorder(root = @root, array = [], &block)
    return if root.nil?

    inorder(root.left, array, &block) unless root.left.nil?
    block.call(root) if block_given?
    array << root.data unless block_given?
    inorder(root.right, array, &block) unless root.right.nil?
    array unless block_given?
  end

  # DLR
  def preorder(root = @root, array = [], &block)
    return if root.nil?

    block.call(root) if block_given?
    array << root.data unless block_given?
    preorder(root.left, array, &block) unless root.left.nil?
    preorder(root.right, array, &block) unless root.right.nil?
    array unless block_given?
  end

  # LRD
  def postorder(root = @root, array = [], &block)
    return if root.nil?

    postorder(root.left, array, &block) unless root.left.nil?
    postorder(root.right, array, &block) unless root.right.nil?
    block.call(root) if block_given?
    array << root.data unless block_given?
  end

  def height(node)
    return if node.nil?

    return 0 if node.left.nil? && node.right.nil?

    left_child_height = node.left.nil? ? 0 : height(node.left)
    right_child_height = node.right.nil? ? 0 : height(node.right)
    (left_child_height > right_child_height ? left_child_height : right_child_height) + 1
  end

  def depth(node, root = @root, depth = 0)
    return if node.nil?

    return depth if root.eql?(node)

    depth += 1
    child_root = node.data < root.data ? root.left : root.right
    depth(node, child_root, depth)
  end

  def balanced?
    return true if @root.nil? || (@root.left.nil? && @root.right.nil?)

    (height(@root.left) - height(@root.right)).abs <= 1
  end

  def rebalance
    array = inorder
    start_index = 0
    end_index = array.length - 1
    @root = build_tree(array, start_index, end_index)
  end

  # Pretty print method to visualize binary search tree
  # rubocop:disable Style/OptionalBooleanParameter
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
  # rubocop:enable Style/OptionalBooleanParameter
end
