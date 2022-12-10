class Tree
  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree(array)
  end

  def build_tree(array, start, end)
    # if the start point is greater than the end point, return nil
    # Get the Middle data point (this is the level-0 root node)
    # set the left node equal to build_tree(array, start, mid-1)
    # set the right node equal to build_tree(array, mid+1, end)
    # Return the level-0 root node
  end
end