require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = @tail.next
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @tail = nil
      @head = nil
    else
      node = @head
      while ((node != nil) && (node.next != @tail)) do
        node = node.next
      end
      @tail = node
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    node = @head
    until node == nil do
      puts node.key
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head != nil
      if @head == node
        remove_front
      elsif @tail == node
        remove_tail
      else
        current = @head
        while current != nil && current.next != node
          current = current.next
        end
        if current.next == node
          current.next = current.next.next
        end
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @tail === @head
      @head = nil
      @tail = nil
    elsif @head != nil
      node = @head.next
      @head = node
    end
  end
end
