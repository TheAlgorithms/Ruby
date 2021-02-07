# Define a node for the list
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

# Class for circular linked list (last node points to the head node)
class CircularList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert_end(value)
    newNode = Node.new(value)
    if @head.nil?
      @head = newNode
      @head.next = @head
    else
      tempNode = @head
      tempNode = tempNode.next while tempNode.next != @head
      newNode.next = @head
      tempNode.next = newNode
    end
  end

  def insert_head(value)
    newNode = Node.new(value)
    if @head.nil?
      @head = newNode
      @head.next = head
    else
      tempNode = @head
      tempNode = tempNode.next while tempNode.next != @head
      newNode.next = @head
      tempNode.next = newNode
      @head = newNode
    end
  end

  def print_list
    print '['
    unless @head.nil?
      printNode = @head
      while printNode.next != @head
        print printNode.value.to_s
        print ', '
        printNode = printNode.next
      end
      print printNode.value
    end
    print ']'
    STDOUT.flush
  end

  def delete_head
    if !@head.nil? && (@head.next != @head)
      newHead = @head.next
      tempNode = newHead
      tempNode = tempNode.next while tempNode.next != @head
      tempNode.next = newHead
      @head = newHead
    elsif !@head.nil? && (@head.next == @head)
      @head = nil
    end
  end

  def delete_end
    if !@head.nil? && (@head.next != @head)
      tempNode = @head
      tempNode = tempNode.next while tempNode.next.next != @head
      tempNode.next = @head
    elsif !@head.nil? && (@head.next == @head)
      @head = nil
    end
  end

  def isEmpty
    @head.nil?
  end
end
