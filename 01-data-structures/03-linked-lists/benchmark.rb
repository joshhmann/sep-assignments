require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
array = []
linkedList = LinkedList.new

Benchmark.bm do |x|
  x.report("array:") do
    for i in 1..n do
      array << i
      end
    end

    x.report("linked list:") do
      for i in 1..n do
        node = Node.new(i)
        linkedList.add_to_tail(node)
      end
    end

  end

  Benchmark.bm do |x|
    x.report("array:") do
      array[4999]
    end

    x.report("linked list:") do
      node = linkedList.head
      for i in 1..4999 do
        node = node.next
      end
      puts node.data
    end

    Benchmark.bm do |x|
      x.report("array:") do
        array.delete_at(4999)
      end

      x.report("linked list:") do
        node = linkedList.head
        for i in 1..4999 do
          node = node.next
        end
        linkedList.delete(node)
      end
    end
  end
