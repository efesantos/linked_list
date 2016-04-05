class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end
 
def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else      
    print "nil\n"
    return
  end
end

def infinite_loop?(list)

  tortoise = LinkedListNode.new(list.value, list.next_node)
  hare = LinkedListNode.new(list.value, list.next_node)

  while hare

    if hare.next_node == nil
      puts "false"
      return false
    end

    hare = hare.next_node

    if hare.next_node == nil
      puts "false"
      return false
    end

    hare = hare.next_node
    tortoise = tortoise.next_node

    if hare == tortoise
      puts "true"
      return true
    end    

  end

end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(99, node3)
node5 = LinkedListNode.new(12, node4)
node6 = LinkedListNode.new(99, node5)
node7 = LinkedListNode.new(12, node6)
node8 = LinkedListNode.new(99, node7)
node9 = LinkedListNode.new(12, node8)
node10 = LinkedListNode.new(99, node9)
node11 = LinkedListNode.new(12, node10)
#node1.next_node = node7

#print_values(node3)

infinite_loop?(node11)