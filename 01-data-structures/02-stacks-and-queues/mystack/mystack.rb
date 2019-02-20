class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.push(item)
    self.top = item 
  end

  def pop
    @stack.pop

  end

  def empty?
    @stack.empty?
  end
end
