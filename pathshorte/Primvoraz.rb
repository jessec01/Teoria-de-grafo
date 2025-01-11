require_relative './graph'
require_relative './edge'
require_relative './heap'
require_relative './queuepriority' # Asegúrate de tener una implementación de cola de prioridad en Ruby
class NodeQueue
  attr_accessor :v, :dist

  def initialize(v, dist = Float::INFINITY)
    @v = v
    @dist = dist
  end
end
class PrimVoraz
  def initialize(graph)
    @markup = Array.new(graph.size, false)
    @dist_a = Array.new(graph.size, Float::INFINITY)
    @edge_a =Array.new(graph.size)
    @priority_queue = PriorityQueue.new { |a, b| a.dist <=> b.dist }
    @graph=Graph.new(graph.i,graph.j,false)
    @dist_a[0] = 0
    @priority_queue.push(NodeQueue.new(0, 0))
    @count=0
    while !@priority_queue.empty?
      node = @priority_queue.pop
      visit(graph, node.v)
    end
  end
  def visit(graph, v)
    @markup[v] = true
    graph.list_graph[v].each do |edge|
      w = edge.extreme_oposite(v)
      if @markup[w]==false
        if edge.size < @dist_a[w]
          @edge_a[w]=edge
          @dist_a[w] = edge.size
          @priority_queue.remove(NodeQueue.new(w))
          @priority_queue.push(NodeQueue.new(w, @dist_a[w]))
        end
     end
    end
  end
  def resulting_tree
    @edge_a
  end
  def graph_new
    @graph
  end
  def count
    @count
  end
  def size
    reduce=0
    @aristaA.each do |date|
      reduce=date.size+reduce
    end
    return reduce
  end
end