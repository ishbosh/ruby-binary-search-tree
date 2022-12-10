class Tree
  def initialize(array)
    @array = array
    @root = build_tree(array)
  end

  def build_tree(array, start, end)
    # Sort the array if it is not sorted
    # Remove duplicates from the array if there are any duplicates
    # if the start point is greater than the end point, return nil
    # Get the Middle data point (this is the level-0 root node)
    # set the left node equal to build_tree(left_side, start, mid-1)
    # set the right node equal to build_tree(right_side, mid+1, end)
    # Return the level-0 root node
  end
end