require 'minitest/autorun'
require 'set'
require_relative 'unweighted_graph'

class TestUnweightedGraph < Minitest::Test
  def test_directed_unweighted_graph_creation
    graph = UnweightedGraph.new(nodes: [:u, :v, :w], neighbors: {:u => [:v]}, directed: true)

    assert graph.nodes.to_set == Set[:u, :v, :w]
    assert graph.neighbors(:u).to_set == Set[:v]
    assert graph.neighbors(:v).empty?
    assert graph.neighbors(:w).empty?
  end

  def test_undirected_unweighted_graph_creation
    graph = UnweightedGraph.new(nodes: [:u, :v, :w], neighbors: {:u => [:v]}, directed: false)

    assert graph.nodes.to_set == Set[:u, :v, :w]
    assert graph.neighbors(:u).to_set == Set[:v]
    assert graph.neighbors(:v).to_set == Set[:u]
    assert graph.neighbors(:w).empty?
  end

  def test_empty_returns_true_for_empty_graph
    graph = UnweightedGraph.new

    assert graph.empty?
  end

  def test_empty_returns_false_for_non_empty_graph
    graph = UnweightedGraph.new(nodes: [:u])

    assert !graph.empty?
  end

  def test_include_returns_true_for_graph_nodes
    graph = UnweightedGraph.new(nodes: [:u])

    assert graph.include?(:u)
  end

  def test_include_returns_false_for_non_graph_nodes
    graph = UnweightedGraph.new

    assert !graph.include?(:u)
  end

  def test_has_neighbor_returns_true_for_graph_node_neighbors
    graph = UnweightedGraph.new(nodes: [:u, :v], neighbors: {:u => [:v]})

    assert graph.has_neighbor?(:u, :v)
  end

  def test_has_neighbor_returns_false_for_non_graph_node_neighbors
    graph = UnweightedGraph.new(nodes: [:u, :v])

    assert !graph.has_neighbor?(:u, :v)
  end

  def test_add_node_adds_node_to_graph
    graph = UnweightedGraph.new
    graph.add_node(:u)

    assert graph.nodes.to_set == Set[:u]
  end

  def test_add_edge_adds_edge_to_directed_unweighted_graph
    graph = UnweightedGraph.new(nodes: [:u, :v], directed: true)
    graph.add_edge(:u, :v)

    assert graph.neighbors(:u).to_set == Set[:v]
    assert graph.neighbors(:v).empty?
  end

  def test_add_edge_adds_edge_to_undirected_unweighted_graph
    graph = UnweightedGraph.new(nodes: [:u, :v], directed: false)
    graph.add_edge(:u, :v)

    assert graph.neighbors(:u).to_set == Set[:v]
    assert graph.neighbors(:v).to_set == Set[:u]
  end
end
