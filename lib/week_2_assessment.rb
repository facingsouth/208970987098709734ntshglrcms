# Your code goes here!
Node = Struct.new(:value, :parent, :left_child, :right_child)

class BinarySearchTree

  attr_reader :root

  def initialize(arr)
    raise ArgumentError.new("Your input must be an array") unless arr.is_a?(Array)

    raise ArgumentError.new("Your input can only contain integers") unless arr.all? {|i| i.is_a? Integer }

    @arr = arr
    @root = Node.new(arr[0], nil, nil, nil)
    build_BST
  end

  def find_node_with_value(val)

    dfs(root, val)
  end


  private

  def dfs(node, val)
    if node.value == val
      return node
    elsif val < node.value
      return if node.left_child.nil?
      dfs(node.left_child, val)
    else
      return if node.right_child.nil?
      dfs(node.right_child, val)
    end
  end

  def build_BST
    (1..arr.length-1).each do |i|
      node = Node.new(arr[i], nil, nil, nil)
      insert_node(node, root)
    end
  end

  def insert_node(node, r)
    if node.value < r.value && r.left_child.nil?
      node.parent = r
      r.left_child = node
      return
    end
    if node.value >= r.value && r.right_child.nil?
      node.parent = r
      r.right_child = node
      return
    end
    if node.value < r.value
      insert_node(node, r.left_child)
    else
      insert_node(node, r.right_child)
    end
  end

  def arr
    @arr
  end
end