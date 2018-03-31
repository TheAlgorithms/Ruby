# A last-in, first-out (LIFO) stack.
#
# Stacks are simple data structures that give you access to a last-in,
# first-out collection of data. You can only ever add elements to and remove
# elements from the top of the stack.
#
# Enqueuing and dequeuing are both in constant time (i.e. O(1)).
#
# Note: This queue is not thread-safe.
#
# Note: You can also implement a stack on top of an Array using `Array#shift`
# and `Array#pop` or `Array#shift` and `Array#unshift`.
class Stack
  include Enumerable

  def initialize
    @head = nil
    @size = 0
  end

  attr_reader :size

  def each
    return to_enum(__callee__) unless block_given?
    return unless @head

    node = @head
    loop do
      yield node.value
      node = node.next or break
    end
  end

  def inspect
    "#<Stack #{to_a.inspect}>"
  end

  def peek
    @head && @head.value
  end

  def pop
    return unless @head

    value, @head = @head.value, @head.next
    @size -= 1
    value
  end

  def push(value)
    @head = new_head = Frame.new(value, @head)
    @size += 1
    self
  end

  private

  Frame = Struct.new(:value, :next)
end
