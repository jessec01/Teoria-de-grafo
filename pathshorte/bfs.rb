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
  
  def initialize(graph,  destination)
    @pi=Array.new(graph.size)
    @edge_a =Array.new(graph.size)
    @pi[0]=nil
    @queue = PriorityQueue.new {|a, b| a.dist <=> b.dist}
    @graph=graph
    @graph.make_list_coordinate
    @queue.push(NodeQueue.new(0, 0))
    @count_relax=0
    @destination=destination
    while not @queue.empty?
      node = @queue.pop
      if node.v==@destination
        return
      end
      relax(@graph, node.v)
      
    end 
  end
  def relax(graph, v)
    @count_relax=@count_relax+1 
    #@markup[v] = true
    #print "hola mundo"
    @graph.list_graph[v].each do |edge|
      w = edge.extreme_oposite(v)
      #print "hola mundo"
      #print "hola mundo:#{@edge_a[w]}" 
      if not @edge_a[w]
        #print "hola mundo:#{@edge_a[w]}" 
        manhanta=distanciaManHattan(w)
        @pi.push(v)
        @edge_a[w]=edge
        @queue.push(NodeQueue.new(w,manhanta))
        #@count_relax=@count_relax+1
      end
      #return
    end
  end  
  def distanciaManHattan(vActual)
    dx = @graph.position_coordinate_x(vActual) - @graph.position_coordinate_x(@destination)
    dx=dx.abs
    dy = @graph.position_coordinate_y(vActual) - @graph.position_coordinate_y(@destination)
    dy=dy.abs
    suma=(dx + dy)
    return suma
  end
  def edge_a
    @edge_a
  end
  def count_relax
    @count_relax
  end
end