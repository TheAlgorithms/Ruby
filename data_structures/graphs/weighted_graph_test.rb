require 'minitest/autorun'
require 'set'
require_relative 'weighted_graph'

class TestWeightedGraph < Minitest::Test
  def test_directed_weighted_graph_creation
    graph = WeightedGraph.new(nodes: [:u, :v, :w], edges: {:u => [[:v, 1]]}, directed: true)

    assert graph.nodes.to_set == Set[:u, :v, :w]
    assert graph.edges(:u) == {:v => 1}
    assert graph.edges(:v).empty?
    assert graph.edges(:w).empty?
  end

  def test_undirected_weighted_graph_creation
    graph = WeightedGraph.new(nodes: [:u, :v, :w], edges: {:u => [[:v, 1]]}, directed: false)

    assert graph.nodes.to_set == Set[:u, :v, :w]
    assert graph.edges(:u) == {:v => 1}
    assert graph.edges(:v) == {:u => 1}
    assert graph.edges(:w).empty?
  end

  def test_empty_returns_true_for_empty_graph
    graph = WeightedGraph.new

    assert graph.empty?
  end

  def test_empty_returns_false_for_non_empty_graph
    graph = WeightedGraph.new(nodes: [:u])

    assert !graph.empty?
  end

  def test_include_returns_true_for_graph_nodes
    graph = WeightedGraph.new(nodes: [:u])

    assert graph.include?(:u)
  end

  def test_include_returns_false_for_non_graph_nodes
    graph = WeightedGraph.new

    assert !graph.include?(:u)
  end

  def test_has_neighbor_returns_true_for_graph_node_neighbors
    graph = WeightedGraph.new(nodes: [:u, :v], edges: {:u => [[:v, 1]]})

    assert graph.has_neighbor?(:u, :v)
  end

  def test_has_neighbor_returns_false_for_non_graph_node_neighbors
    graph = WeightedGraph.new(nodes: [:u, :v])

    assert !graph.has_neighbor?(:u, :v)
  end

  def test_edge_weight_returns_neighbor_edge_weight
    graph = WeightedGraph.new(nodes: [:u, :v], edges: {:u => [[:v, 4]]})

    assert graph.edge_weight(:u, :v) == 4
  end

  def test_add_node_adds_node_to_graph
    graph = WeightedGraph.new
    graph.add_node(:u)

    assert graph.nodes.to_set == Set[:u]
  end

  def test_add_edge_adds_edge_to_directed_weighted_graph
    graph = WeightedGraph.new(nodes: [:u, :v], directed: true)
    graph.add_edge(:u, :v, 2)

    assert graph.edges(:u) == {:v => 2}
    assert graph.edges(:v).empty?
  end

  def test_add_edge_adds_edge_to_undirected_weighted_graph
    graph = WeightedGraph.new(nodes: [:u, :v], directed: false)
    graph.add_edge(:u, :v, 2)

    assert graph.edges(:u) == {:v => 2}
    assert graph.edges(:v) == {:u => 2}
  end
end
