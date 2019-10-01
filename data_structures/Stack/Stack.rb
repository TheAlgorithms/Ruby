=begin
This method is the stack constructor. It creates an empty stack, sets the head node to nil and the stack’s length to 0.
=end

def initialize
    self.head   = nil
    self.length = 0
end

=begin
Creates a new node to insert a value into the stack. The new node moves the element that’s at the head of the list and becomes the new head of the list.
=end

def push data
    node = Node.new data
    if length == 0
        self.tail = node
    end
    node.next = self.head
    self.head = node
    self.length += 1
end

=begin
Removes an element from the stack. As it happens with queues, removals are straightforward because they always happen at the head of the stack.
=end

def pop
    return nil unless self.length > 0    
    self.head = self.head.next
    self.tail = nil if self.length == 1
    self.length -= 1
end

=begin
Returns the node that’s at the head of the stack without removing it or nil if the stack is empty.
Since pop doesn’t return the removed element, peek is the way to go if you have to do something with that element.
=end

def peek
    self.head
end

#Pops all elements from the stack.

def clear
    while self.peek
        pop
    end
end

=begin
This method walks the stack yielding one at a time until it reaches the last element.
=end

def each
    return nil unless block_given?
    current = self.head
    while current
        yield current
        current = current.next
    end
end

#Print the contents of the stack by walking its items.

def print
    if self.length == 0
        puts "empty"
    else
        self.each { |node| puts node.data }
    end
end
