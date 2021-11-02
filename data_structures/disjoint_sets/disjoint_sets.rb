class Node
  attr_accessor :data, :parent, :rank, :parent, :rank

  def initialize(data)
    @data = data
    @parent = self
    @rank = 0
  end
end

class DisjointSets
  def make_set(d)
    Node.new(d)
  end

  def find_set(x)
    raise ArgumentError unless x.class <= Node

    x.parent = (find_set(x.parent)) unless x.parent == x
    x.parent
  end

  def union_set(x, y)
    px = find_set(x)
    py = find_set(y)
    return if px == py

    if px.rank > py.rank
      py.parent = px
    elsif py.rank > px.rank
      px.parent = py
    else
      px.parent = py
      py.rank += 1
    end
  end
end

ds = DisjointSets.new
one = ds.make_set(1)
two = ds.make_set(2)
three = ds.make_set(3)
ds.union_set(one, two)
puts ds.find_set(one) == ds.find_set(two) # should be true
ds.union_set(one, three)
puts ds.find_set(two) == ds.find_set(three) # should be true
puts one.rank + two.rank + three.rank == 1 # should be true
