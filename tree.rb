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
end