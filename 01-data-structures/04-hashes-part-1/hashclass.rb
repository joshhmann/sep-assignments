class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    item = HashItem.new(key, value)
    i = index(key, @size)
      while @items[i] != nil && value != @items[i].value
        resize
      end
      @items[i] = item
  end


  def [](key)
    @items[index(key, @size)].value
  end

  def resize
    x = @items.compact
    @size = @size * 2
    @items = Array.new(@size)

    x.each do |item|
      i = index(item.key, @size)
      @items[i] = item
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end
end
