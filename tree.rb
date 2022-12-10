require_relative 'node'

class Tree
  def initialize(array)
    @array = array.uniq.sort
    end_index = @array.length - 1
    start_index = 0
    @root = build_tree(@array, start_index, end_index)
  end

  def build_tree(array, start_index, end_index)
    # if the start point is greater than the end point, return nil
    return nil if start_index > end_index
    # Get the Middle data point (this is the level-0 root node)
    mid_index = (start_index + end_index) / 2
    root = Node.new(array[mid_index])
    # set the left node equal to build_tree(array, start, mid-1)
    root.left = build_tree(@array, start_index, mid_index - 1)
    # set the right node equal to build_tree(array, mid+1, end)
    root.right = build_tree(@array, mid_index + 1, end_index)
    # Return the level-0 root node
    root
  end

  def insert(root = @root, data)
    return root = Node.new(data) if root.nil?

    return root if root.data.eql?(data)

    root.left = insert(root.left, data) if data < root.data
    root.right = insert(root.right, data) if data > root.data
    root
  end

  def delete(root = @root, data)

  end

  def find
  end

  def level_order
  end

  def inorder
  end

  def preorder
  end

  def postorder
  end

  def height
  end

  def depth
  end

  def balanced?
  end

  def rebalance
  end

  # Pretty print method to visualize binary search tree
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end