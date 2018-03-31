# A double-ended queue (or deque) implemented as a double-linked list.
#
# Double-ended queues give you constant-time (i.e. O(1)) lookup for both the
# head and the tail of the list and also allow you to easily traverse in either
# direction through the queue.
#
# Random access via the `#[]` method is in linear time (i.e. O(n)) because there
# is no direct access to any elements other than the head and the tail.
#
# Note: This deque is not thread-safe.
class Deque
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def [](index)
    each.lazy.map { |e| e }.first(index + 1)[index]
  end

  def clear
    @head = @tail = nil
  end

  def each
    return to_enum(__callee__) unless block_given?
    return unless @head

    node = @head

    loop do
      yield node.value
      node = node.next or break
    end
  end

  def head
    @head && @head.value
  end

  def inspect
    nodes = map { |node| "#{node} <->" }

    if nodes.any?
      last_node = nodes.pop[0...-4]
      nodes.push(last_node)
    end

    "#<Deque [#{nodes.join(' ')}]>"
  end

  def pop
    return unless @tail

    value, @tail = @tail.value, @tail.prev
    value
  end

  def push(value)
    if @tail
      @tail = @tail.append(value)
    else
      @tail = @head = Node.new(value)
    end

    self
  end

  def reverse_each
    return to_enum(__callee__) unless block_given?
    return unless @tail

    node = @tail

    loop do
      yield node.value
      node = node.prev or break
    end
  end

  def shift
    return unless @head

    value, @head = @head.value, @head.next
    value
  end

  def tail
    @tail && @tail.value
  end

  def unshift(value)
    if @head
      @head = @head.prepend(value)
    else
      @head = @tail = Node.new(value)
    end

    self
  end

  private

  Node = Struct.new(:value, :prev, :next) do
    def append(value)
      self.next = Node.new(value, self, nil)
    end

    def inspect
      value
    end

    def prepend(value)
      self.prev = Node.new(value, nil, self)
    end
  end
end
