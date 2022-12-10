class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  # Comparable module implementation
  def <=>(other)
    data <=> other
  end
end