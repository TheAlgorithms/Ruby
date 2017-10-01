# A simple first-in, first-out (FIFO) queue.
#
# Queues are simple data structures that give you access to a first-in,
# first-out collection of data. You can only ever add elements to the end of
# the queue and you can only ever remove elements form the front of the queue.
#
# Enqueuing and dequeuing are both in constant time (i.e. O(1)).
#
# Note: This code should not be used for any purpose other than for learning.
# There is a built-in `Queue` class in the Ruby standard library that will be
# more performant than this one.
#
# Note: This queue is not thread-safe.
#
# Note: You can also implement a queue on top of an Array using `Array#push`
# (enqueue) and `Array#shift` (dequeue) or `Array#unshift` (enqueue) and
# `Array#pop` (dequeue).
class SimpleQueue
  include Enumerable

  def initialize
    @head = @tail = nil
    @size = 0
  end

  attr_reader :size

  def dequeue
    return unless @head

    value, @head = @head.value, @head.next
    @size -= 1
    value
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

  def enqueue(element)
    if @tail
      @tail = @tail.append(element)
    else
      @tail = @head = Element.new(element)
    end
    @size += 1
    self
  end

  def inspect
    "#<SimpleQueue #{to_a.inspect}>"
  end

  def peek
    @head && @head.value
  end

  private

  Element = Struct.new(:value, :next) do
    def append(value)
      self.next = self.class.new(value)
    end
  end
end
