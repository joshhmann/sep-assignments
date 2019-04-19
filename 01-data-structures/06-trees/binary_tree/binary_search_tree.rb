require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      if root.left.nil?
      root.left = node
      else
      insert(root.left, node)
      end
    else
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root == nil || data == nil
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    find_node = find(root, data)
    if find_node == nil
      return nil
    else
      find_node.title = nil
      find_node.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    result = []
    while queue.length > 0
      new_root = queue.shift
      if new_root.left != nil
        queue.push(new_root.left)
      end
      if new_root.right != nil
        queue.push(new_root.right)
      end
      result.push("#{new_root.title}: #{new_root.rating}")
    end
    result.each do |x|
      puts x
    end 
  end
end
