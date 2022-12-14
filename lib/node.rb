# frozen_string_literal: true

# Implements the Node class for the binary search trees
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end

  # Comparable module implementation
  def <=>(other)
    data <=> other
  end
end
