##
# This class represents an array-backed max-heap.

class MaxHeap

  attr_reader :arr
  attr_accessor :heap_size

  ##
  # Creates a new max-heap using the provided collection of initial values, if provided (empty by default).
  # Note: a clone of the input collection is created to avoid alterations to the input.

  def initialize(elements = [])
    @arr = [0] + elements.map(&:clone)
    @heap_size = arr.size - 1
    for i in ((arr.size / 2).floor).downto 1
      max_heapify(i)
    end
  end

  def to_array
    return arr[1..heap_size].map(&:clone)
  end

  def empty?
    return heap_size == 0
  end

  def max
    return nil if empty?
    return @arr[1]
  end

  def extract_max
    return nil if empty?
    m = max
    @arr[1] = @arr[heap_size]
    @heap_size -= 1
    max_heapify(1)
    return m
  end

  def insert(k)
    @heap_size += 1
    @arr[heap_size] = -Float::INFINITY
    increase_to(heap_size, k)
  end

  private
  def max_heapify(i)
    l = left(i)
    r = right(i)
    m = i
    if l <= heap_size && arr[l] > arr[i]
      m = l
    end
    if r <= heap_size && arr[r] > arr[m]
      m = r
    end
    if m != i
      arr[i], arr[m] = arr[m], arr[i]
      max_heapify(m)
    end
  end

  def increase_to(i, k)
    raise ArgumentError.new('MaxHeap#increase_to does not support lower values for the key') if arr[i] > k
    @arr[i] = k
    j = i
    while parent(j) > 0 && arr[parent(j)] < arr[j]
      arr[j], arr[parent(j)] = arr[parent(j)], arr[j]
      j = parent(j)
    end
  end

  def parent(i)
    return (i / 2).floor
  end

  def left(i)
    return 2*i
  end

  def right(i)
    return 2*i + 1
  end
end