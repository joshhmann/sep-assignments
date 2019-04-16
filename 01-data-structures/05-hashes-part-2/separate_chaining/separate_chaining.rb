require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @size = size
    @load_count = 0.0
    @lists = Array.new(@size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, size)

    if @lists[i].nil?
      list = LinkedList.new
    else
      list = @list[i]
    end

    list.add_to_tail(node)
    @lists[i] = list
    @load_count += 1
  end

  def [](key)
    i = index(key, @size)
    list = @lists[i]
    if list != nil
      current = list.head
      while current != nil
        if current.key == key
          return current.value
        end
        current = current.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @load_count /= @size
  end

  # Simple method to return the number of items in the hash
  def size
    @lists.length
  end

  # Resize the hash
  def resize
    last_item = @lists.compact
    @size = @size * 2
    @lists = Array.new(@size)

    last_item.each do |item|
      current = item.head
      i = index(current.key, @size)

      while current != nil
        list = LinkedList.new
        list.add_to_tail(current)
        @lists[i] = list
        curent = current.next
      end
    end
  end
end
