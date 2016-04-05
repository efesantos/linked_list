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


def reverse_list(list, previous=nil)

  tail = list  #mark the end of the list
  previous_node = LinkedListNode.new(list.value, list.next_node) 

  #move up the list 
  while list.next_node != nil
    previous_node = list
    list = list.next_node
  end 

  #mark the node to be altered in the next iteration
  previous_node.next_node = nil  

  #change the direction the node is pointed to (from the subsequent node to the previous one)
  list.next_node = ObjectSpace._id2ref(previous_node.object_id) 

  #repeat until all nodes have been redirected, ie, when the tail is the one being altered
  if previous_node != tail
    reverse_list(tail)
  end

  return list
 
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


