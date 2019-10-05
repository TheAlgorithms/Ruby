#Define a node for the list
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
	
	def initialize()
    @head = nil
  end

  def insert_end(value)
    newNode = Node.new(value)
    if (@head == nil)
			@head = newNode
			@head.next = @head
    else
      tempNode = @head
      while (tempNode.next != @head)
        tempNode = tempNode.next
			end
			newNode.next = @head
      tempNode.next = newNode
    end
  end

  def insert_head(value)
    newNode = Node.new(value)
    if (@head == nil)
			@head = newNode
			@head.next = head
    else
			tempNode = @head
			while (tempNode.next != @head)
				tempNode = tempNode.next
			end
			newNode.next = @head
			tempNode.next = newNode
			@head = newNode
    end
  end

  def print_list
    print "["
    if (@head != nil)
      printNode = @head
      while (printNode.next != @head)
				print "#{printNode.value}"
				print ", "
        printNode = printNode.next
			end
			print printNode.value
    end
    print "]"
    STDOUT.flush
  end

  def delete_head
    if (@head != nil) && (@head.next != @head)
			newHead = @head.next
			tempNode = newHead
			while(tempNode.next != @head)
				tempNode = tempNode.next
			end
			tempNode.next = newHead
			@head = newHead
    elsif (@head != nil) && (@head.next == @head)
      @head = nil
    end
  end

	def delete_end
		if (@head != nil) && (@head.next != @head)
      tempNode = @head
      while (tempNode.next.next != @head)
        tempNode = tempNode.next
      end
      tempNode.next = @head
		elsif (@head != nil) && (@head.next == @head)
			@head = nil
		end
  end

  def isEmpty()
    return (@head==nil)
  end
end