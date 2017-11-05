# Define a node in the list
class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

# A Class for single linked lists (each element links to the next one, but not to the previous one)

class SingleList
  attr_accessor :head
  def initialize()
    @head = nil
  end

  def insert_tail(value)
    newNode = Node.new(value)
    if (@head == nil)
      @head = newNode
    else
      tempNode = @head
      while (tempNode.next != nil)
        tempNode = tempNode.next
      end
      tempNode.next = newNode
    end
  end

  def insert_head(value)
    newNode = Node.new(value)
    if (@head == nil)
      @head = newNode
    else
      newNode.next = @head
      @head = newNode
    end
  end

  def print_list()
    print "["
    if (@head != nil)
      printNode = @head
      while (printNode != nil)
        print "#{printNode.value}"
        if (printNode.next != nil)
          print ", "
        end
        printNode = printNode.next
      end
    end
    print "]"
    STDOUT.flush
  end

  def delete_head
    if (@head != nil) && (@head.next != nil)
      newHead = @head.next
      @head = newHead
    elsif (@head != nil) && (@head.next == nil)
      @head = nil
    end
  end

  def delete_tail
    if (@head != nil)
      tempNode = @head
      while (tempNode.next.next != nil)
        tempNode = tempNode.next
      end
      tempNode.next = nil
    end
  end

  def isEmpty()
    return (@head==nil)
  end

end