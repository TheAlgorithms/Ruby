class DoublyLinkedList
  # Initialize the data structure here.
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  # Get the value of the index-th node in the linked list.
  # If the index is invalid, return -1.
  def get(index)
    return -1 if @head.nil?
    return -1 if index > @size - 1

    if index < @size - index
      iter = @head
      cnt = 0
      until iter.nil?
        return iter.val if cnt == index

        iter = iter.next
        cnt += 1
      end
    else
      iter = @tail
      cnt = @size - 1
      until iter.nil?
        return iter.val if cnt == index

        iter = iter.prev
        cnt -= 1
      end
    end
    -1
  end

  # Add a node of value val before the first element of the linked list.
  # After the insertion, the new node will be the first node of the linked list.
  def insert_head(val)
    node = Node.new(val, nil, @head)
    @tail = node unless @head
    @head.prev = node if @head
    @head = node
    @size += 1
  end

  # Append a node of value val to the last element of the linked list.
  def insert_tail(val)
    return insert_head(val) unless @head

    node = Node.new(val, @tail, nil)
    @tail.next = node
    @tail = node
    @size += 1
  end

  # Add a node of value val before the index-th node in the linked list.
  # If index equals to the length of linked list, the node will be appended
  # to the end of linked list. If index is greater than the length, the node
  # will not be inserted.
  def add_at_index(index, val)
    case index
    when 0 then insert_head(val)
    when @size then insert_tail(val)
    when 1...@size
      if index < @size - index
        iter = @head
        cnt = 0
        until iter.nil?
          return insert(iter, Node.new(val)) if cnt == index - 1

          iter = iter.next
          cnt += 1
        end
      else
        iter = @tail
        cnt = @size - 1
        until iter.nil?
          return insert(iter, Node.new(val)) if cnt == index - 1

          iter = iter.prev
          cnt -= 1
        end
      end
    end
  end

  def insert(node, new_node)
    new_node.prev = node
    new_node.next = node.next
    node.next.prev = new_node
    node.next = new_node
    @size += 1
  end

  # Delete the index-th node in the linked list, if the index is valid.
  def delete_at_index(index)
    case index
    when 0
      return unless @head
      return @head, @tail, @size = nil, nil, 0 if @size == 1

      remove(@head)
    when @size - 1
      remove(@tail)
    when 1...@size - 1
      if index < @size - index
        iter = @head
        cnt = 0
        until iter.nil?
          return remove(iter) if cnt == index

          iter = iter.next
          cnt += 1
        end
      else
        iter = @tail
        cnt = @size - 1
        until iter.nil?
          return remove(iter) if cnt == index

          iter = iter.prev
          cnt -= 1
        end
      end
    end
  end

  def remove(node)
    if node == @head
      @head = @head.next
      @head.prev = nil
    elsif node == @tail
      @tail = tail.prev
      @tail.next = nil
    else
      node.prev.next = node.next
      node.next.prev = node.prev
    end
    @size -= 1
  end

  def print_values(head = @head)
    print "#{head.val} --> "
    if head.next.nil?
      puts("nil\n")
    else
      print_values(head.next)
    end
  end
end

class Node
  attr_accessor :val, :prev, :next

  def initialize(val = nil, prev = nil, next_ = nil)
    @val = val
    @prev = prev
    @next = next_
  end
end

obj = DoublyLinkedList.new
obj.get(1)

obj.insert_head(2)
obj.print_values

obj.insert_tail(3)
obj.print_values

obj.add_at_index(3, 5)
obj.print_values

obj.delete_at_index(1)
obj.print_values
