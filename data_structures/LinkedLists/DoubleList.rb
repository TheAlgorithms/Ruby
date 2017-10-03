# Define a node in the list
class Node
  attr_accessor :value, :next, :prev
  def initialize(value)
    @value = value
    @next = nil
    @prev = nil
  end
end

# A Class for double linked lists (each element links to the next one, and to the previous one)
class DoubleList
  attr_accessor :head, :tail
  def initialize()
    @head = nil
    @tail = nil
  end

  def insert_tail(value)
    new_node = Node.new(value)
    if (@head == nil)
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      new_node.prev = @tail
      @tail = new_node
    end
  end

  def insert_head(value)
    new_node = Node.new(value)
    if (@head == nil)
      @head = new_node
      @tail = new_node
    else
      new_node.next = @head
      @head.prev = new_node
      @head = new_node
    end
  end

  def delete_tail()
    if (@tail != nil)
      @tail = @tail.prev
      if (@tail != nil)
        @tail.next = nil
      end
    end
  end

  def delete_head()
    if (@head != nil)
      @head = @head.next
      if (@head != nil)
        @head.prev = nil
      end
    end
  end

  def print_list()
    print "["
    if (@head != nil)
      printNode = @head
      while (printNode != nil)
        print "#{printNode.value}"
        if (printNode != @tail)
          print ", "
        end
        printNode = printNode.next
      end
    end
    print "]"
    STDOUT.flush
  end

  def is_empty()
    return (@head==nil)
  end
end