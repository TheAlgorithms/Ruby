require 'minitest/autorun'
require_relative 'bfs'
require_relative 'unweighted_graph'

class TestBfs < Minitest::Test
  def test_bfs_visits_single_graph_node
    graph = UnweightedGraph.new(nodes: [:u, :v, :w], directed: false)
    graph.add_edge(:u, :v)

    bfs_result = bfs(graph, :w)

    assert bfs_result.visited.to_set == [:w].to_set
    assert bfs_result.parents == {
        :w => nil
    }
    assert bfs_result.distances == {
        :w => 0
    }
  end

  def test_bfs_visits_graph_fully
    graph = UnweightedGraph.new(nodes: [:u, :v, :w, :x], directed: false)
    graph.add_edge(:u, :v)
    graph.add_edge(:u, :w)
    graph.add_edge(:w, :x)

    bfs_result = bfs(graph, :u)

    assert bfs_result.visited.to_set == [:u, :v, :w, :x].to_set
    assert bfs_result.parents == {
        :u => nil,
        :v => :u,
        :w => :u,
        :x => :w
    }
    assert bfs_result.distances == {
        :u => 0,
        :v => 1,
        :w => 1,
        :x => 2
    }
  end

  def test_bfs_visits_graph_partially
    graph = UnweightedGraph.new(nodes: [:u, :v, :w, :x, :y, :z], directed: false)
    graph.add_edge(:u, :v)
    graph.add_edge(:w, :x)
    graph.add_edge(:x, :y)
    graph.add_edge(:y, :z)

    bfs_result = bfs(graph, :x)

    assert bfs_result.visited.to_set == [:w, :x, :y, :z].to_set
    assert bfs_result.parents == {
        :w => :x,
        :x => nil,
        :y => :x,
        :z => :y
    }
    assert bfs_result.distances == {
      :w => 1,
      :x => 0,
      :y => 1,
      :z => 2
    }
  end

  def test_bfs_visits_with_seen_node_consumer
    graph = UnweightedGraph.new(nodes: [:u, :v, :w], directed: false)
    graph.add_edge(:u, :v)
    graph.add_edge(:u, :w)

    seen_order = []
    bfs(graph, :w, seen_node_consumer: ->(node) { seen_order.append(node) })

    assert seen_order == [:w, :u, :v]
  end

  def test_bfs_visits_with_visited_node_consumer
    graph = UnweightedGraph.new(nodes: [:u, :v, :w], directed: false)
    graph.add_edge(:u, :v)
    graph.add_edge(:u, :w)

    visited_order = []
    bfs(graph, :w, visited_node_consumer: ->(node) { visited_order.append(node) })

    assert visited_order == [:w, :u, :v]
  end
end
