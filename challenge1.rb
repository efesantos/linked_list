def print_values(list_node)
  if list_node
    print "#{list_node.value} -->"
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


class Stack
  attr_reader :data, :node

  def initialize
    @data = nil
  end

  def push(value)
    @node = LinkedListNode.new(value, ObjectSpace._id2ref(@node.object_id))
  end

  def pop
    value = @node.value
    @node = @node.next_node
    return value
  end

end  


def reverse_list(list)

  stack = Stack.new

  while list
    stack.push(list.value)
    list = list.next_node
  end

  return stack.node
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(32, node3)
node5 = LinkedListNode.new(45, node4)
node6 = LinkedListNode.new(56, node5)

print_values(node6)

puts "-------"

revlist = reverse_list(node6)

print_values(revlist)


