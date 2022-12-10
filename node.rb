class Node
  include Comparable

  attr_reader :data
  attr_accessor :left, :right

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