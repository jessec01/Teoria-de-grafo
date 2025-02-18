require_relative './graph'
require_relative './edge'
require_relative './heap'
require_relative './queuepriority'

class NodeQueue
  attr_accessor :v, :dist

  def initialize(v, dist = Float::INFINITY)
    @v = v
    @dist = dist
  end
end

class BestFirstSearch
  
  def initialize(graph, origin, destination)
    @pi=Array.new(graph.size)
    @edge_a =Array.new(graph.size)
    @pi[0]=nil
    @queue = PriorityQueue.new {|a, b| a.dist <=> b.dist}
    graph=Graph.new(graph.i,graph.j,false)
    @queue.push(NodeQueue.new(0, 0))
    @count_relax=0
    @destination=destination
    while !@queue.empty?
      node = @queue.pop
      @count_relax=@count_relax+1
      relax(graph, node.v) 
    end 
  end
  def relax(graph, v)
    @markup[v] = true
    graph.list_graph[v].each do |edge|
      w = edge.extreme_oposite(v)
      if not graph.exist_edge(w)
        manhanta=distanciaManHattan(w,v)
        @edge_a.push(edge)
        @queue.push(NodeQueue.new(w,manhanta))
          @count_relax=@count_relax+1
          if w==@destination
            return
          end
        end
      end
    end
  end  
  def distanciaManHattan(vActual)
    dx = @graph.position_coordinate_x(vActual) - @graph.position_coordinate_x(@destination)
    dx=dx.abs
    dy = @graph.position_coordinate_y(vActual) - @graph.position_coordinate_y(@destination)
    dy=dy.abs
    return (dx + dy)
  end
  def edge_a
    @edge_a
  end
end