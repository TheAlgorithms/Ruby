# Challenge name: Circular Queue
#
# Design the implementation of a circular queue.
# The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle and
# the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".
#

#
# Complexity Analysis
#
# Time complexity: O(1).
# All of the methods in our circular data structure are of constant time complexity.
#
# Space Complexity: O(N).
# The overall space complexity of the data structure is linear, where N is the pre-assigned capacity of the queue.
# However, it is worth mentioning that the memory consumption of the data structure remains as its pre-assigned capacity during its entire life cycle.

class CircularQueue
  def initialize(max_size)
    @max_size = max_size
    @queue = Array.new(max_size, nil)
    @front = 0
    @back = 0
    @size = 0
  end

  attr_accessor :front, :back, :size
  attr_reader :max_size, :queue

  def empty?
    size == 0
  end

  def peek
    return nil if empty?

    queue[front]
  end

  def add(x)
    raise 'Queue is at max capacity' if size == max_size

    queue[back] = x
    @back = (back + 1) % max_size
    @size += 1
  end

  def pop
    raise 'Queue is empty' if size == 0

    temp = queue[front]
    queue[front] = nil
    @front = (front + 1) % max_size
    @size -= 1

    temp
  end
end

queue = CircularQueue.new(3)

begin
  queue.pop
rescue StandardError => e
  puts e.message
end

queue.add(1)
queue.add(2)
queue.add(3)

begin
  queue.add(4)
rescue StandardError => e
  puts e.message
end

puts queue.inspect
# => #<CircularQueue:0x00007fea23876cd8 @max_size=3, @queue=[1, 2, 3], @front=0, @back=0, @size=3>

puts queue.peek
# => 1

queue.pop

puts queue.peek
# => 2
