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
  attr_reader :head

  def initialize
    @head = nil
  end

  def insert_tail(value)
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

    puts(STDOUT.flush)
  end

  def delete_head
    return if @head.nil?

    if @head.next != @head
      newHead = @head.next
      tempNode = newHead
      tempNode = tempNode.next while tempNode.next != @head
      tempNode.next = newHead
      @head = newHead
    elsif !@head.nil? && (@head.next == @head)
      @head = nil
    end
  end

  def delete_tail
    return if @head.nil?

    if @head.next != @head
      tempNode = @head
      tempNode = tempNode.next while tempNode.next.next != @head
      tempNode.next = @head
    elsif !@head.nil? && (@head.next == @head)
      @head = nil
    end
  end

  def is_empty
    @head.nil?
  end
end

obj = CircularList.new

obj.insert_tail(1)
obj.insert_tail(2)
obj.insert_tail(3)
obj.insert_tail(4)
obj.insert_tail(5)
obj.print_list

obj.insert_head(6)
obj.print_list

obj.delete_tail
obj.print_list

obj.delete_head
obj.print_list
