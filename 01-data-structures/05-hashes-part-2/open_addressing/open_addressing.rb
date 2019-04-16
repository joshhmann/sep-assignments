require_relative 'node'

class OpenAddressing
  def initialize(size)
    @nodes = Array.new(size)
    @size = size
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = next_open_index(i)
    if i == -1
      resize
    end
  end

  def [](key)
    ind = index(key, @size)
    (ind...(ind + size)).each do |i|
      if i >= @size
        i = i % @size
      end
      node = @nodes[i]
      if key == node.key
        return node.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    (index...(index + @size)).each do |i|
      if i >= @size
        i = i % @resize
      end
      if @nodes[i] == nil
        return i
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @nodes.length
  end

  # Resize the hash
  def resize
    x = @nodes.compact
    @size = @size * 2
    @nodes = Array.new(@size)

    x.each do |node|
      i = index(node.key, @size)
      @nodes[i] = node
    end 
  end
end
