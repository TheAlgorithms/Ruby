# A queue is like a waiting list.
# Imagine you’re waiting in line to buy the latest Android product
# or getting a parking ticket. These are queues!

#
#
# 1. An array can behave like a Queue if you use the right methods.
#
# These methods are:
# - unshift (or prepend with Ruby 2.5+): when you unshift,
# you are adding one item to the queue
# - pop

class ArrayQueue
  def initialize(queue = [])
    @queue = queue
  end

  attr_accessor :queue

  def add(item)
    queue.unshift(item)
  end

  def pop
    queue.pop
  end

  def peek
    queue[-1]
  end
end

queue = ArrayQueue.new
queue.add(3)
queue.add(4)
queue.add(5)

puts queue.inspect
# => #<ArrayQueue:0x00007fc78200f5e0 @queue=[5, 4, 3]>

queue.pop

puts queue.inspect
# => #<ArrayQueue:0x00007fc78200f5e0 @queue=[5, 4]>

puts(queue.peek)
# => 4

#
#
# 2. Ruby Concurrent Queue
# Ruby has a proper thread-safe, blocking, Queue class.
# You can use this queue for coordinating work in a multi-threaded program.
#

que = Queue.new

que << 1
que << 2
que << 3

que.pop
# 1

que.pop
# 2

# If the queue is empty, calling pop will put your current
# thread to sleep & wait until something is added to the queue.

#
#
# 3. How to Use A Sized Queue
# A sized queue is the same as a regular queue but with a size limit.
#

que = SizedQueue.new(5)

# When the queue is full, the push (same as <<) operation
# will suspend the current thread until an item is taken off the queue.

que.push(:oranges)
que.push(:apples)
que.push(:blue)
que.push(:orange)
que.push(:green)
# At this point, the SizedQueue is full

que.push(:throw_expection)
# data_structures/queues/queue.rb:81:in `push': No live threads left. Deadlock? (fatal)
# 1 threads, 1 sleeps current:0x00007ff54f407130 main thread:0x00007ff54f407130
# * #<Thread:0x00007ff54f86ef38 sleep_forever>
#    rb_thread_t:0x00007ff54f407130 native:0x000000010dd24dc0 int:0
#    data_structures/queues/queue.rb:81:in `push'
#    data_structures/queues/queue.rb:81:in `<main>'
# 	from data_structures/queues/queue.rb:81:in `<main>'

# You can choose to raise an exception, passing true as an argument as follows:
que.push(:throw_expection, true)
# data_structures/queues/queue.rb:83:in `push': queue full (ThreadError)
# 	from data_structures/queues/queue.rb:83:in `<main>'
