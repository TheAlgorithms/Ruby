require 'set'

##
# This class aims to represent weighted graphs
# (i.e. graphs for which edges between nodes have specific weights associated to them).
#
# Both directed (i.e. an edge between node U and node V does not imply an edge in the opposite direction)
# and undirected graphs are supported, depending on the constructor invocation.

class WeightedGraph
  attr_reader :nodes
  attr_reader :directed

  def initialize(nodes: [], edges: {}, directed: true)
    @nodes = Set[]
    @edges = {}
    @directed = directed
    for node in nodes
      add_node(node)
    end
    edges.each do |node, edges|
      for neighbor, weight in edges
        add_edge(node, neighbor, weight)
      end
    end
  end

  def add_node(node)
    if include?(node)
      raise ArgumentError, "node #{node} already exists in this graph!"
    end
    @nodes.add(node)
    @edges[node] = {}
  end

  def add_edge(start_node, end_node, weight)
    if has_neighbor?(start_node, end_node)
      raise ArgumentError, "node #{start_node} already has an edge to #{end_node} in this graph!"
    end
    @edges[start_node][end_node] = weight
    @edges[end_node][start_node] = weight unless directed
  end

  def edges(node)
    unless include?(node)
      raise ArgumentError, "node #{node} does not exist in this graph!"
    end
    @edges[node]
  end

  def empty?
    nodes.empty?
  end

  def include?(node)
    nodes.include?(node)
  end

  def has_neighbor?(start_node, end_node)
    edges(start_node).key?(end_node)
  end

  def edge_weight(start_node, end_node)
    edges(start_node)[end_node]
  end
end
