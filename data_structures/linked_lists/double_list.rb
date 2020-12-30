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
  include Enumerable
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def insert_tail(value)
    new_node = Node.new(value)
    if @head.nil?
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
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next = @head
      @head.prev = new_node
      @head = new_node
    end
  end

  def delete_tail
    until @tail.nil?
      @tail = @tail.prev
      @tail.next = nil unless @tail.nil?
    end
  end

  def delete_head
    until @head.nil?
      @head = @head.next
      @head.prev = nil unless @head.nil?
    end
  end

  def each
    return if @head.nil?

    current = @head
    until current.nil?
      yield current.value
      current = current.next
    end
  end

  def print_list
    # the to_a method is from Enumerable, will call each to get the values, and return an array
    puts '[' + self.to_a.join(', ') + ']'
  end

  def empty?
    @head.nil?
  end
end
