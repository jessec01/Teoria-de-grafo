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
class AEstrella
  def initialize(graph,destination)
    @markup = Array.new(graph.size, false)
    @dist_a = Array.new(graph.size, Float::INFINITY)
    @edge_a =Array.new(graph.size)
    @queue = PriorityQueue.new {|a, b| a.dist <=> b.dist}
    @graph=graph
    @graph.make_list_coordinate
    @dist_a[0] = 0
    @queue.push(NodeQueue.new(0, 0))
    @count_relax=0
    @destination=destination
    while !@queue.empty?
      node = @queue.pop
      if node.v==@destination
        return
      end  
      relax(graph, node.v)
      
    end
  end
  def relax(graph, v)
    @count_relax=@count_relax+1
    @markup[v] = true
    graph.list_graph[v].each do |edge|
      w = edge.extreme_oposite(v)
      if @markup[w]==false
        if @dist_a[v]+edge.size < @dist_a[w]
          manhanta=distanciaManHattan(w)
          #print "en#{w}:#{manhanta}--"
          @dist_a[w] =@dist_a[v]+edge.size
          @edge_a[w]=edge
          if @queue.exist_value(w)
            @queue.update(NodeQueue.new(w,@dist_a[w]+manhanta))
          else
            @queue.push(NodeQueue.new(w,@dist_a[w]+manhanta))          
          end  
          #@count_relax=@count_relax+1
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
    #puts vActual
    #puts ""
    #puts @graph.position_coordinate_x(vActual)
    #puts dx
    dy = @graph.position_coordinate_y(vActual) - @graph.position_coordinate_y(@destination)
    dy=dy.abs
    #puts dy
    suma=(dx + dy)
    return suma
  end
  def count_relax
    @count_relax
  end
  def resulting_tree
    @edge_a
  end
  def path_a(v)
    list_vertice=[]
    edge_aux=nil
    if @edge_a[v]!=nil
      edge_aux=@edge_a[v]
      list_vertice.push(v)
      while edge_aux!=nil
        list_vertice.unshift(edge_aux.origin)
        edge_aux=@edge_a[edge_aux.origin]
      end
    end
    return list_vertice
  end
  def exist_path(v)
    return @dist_a[v]<Float::INFINITY
  end
  def dist_a
    @dist_a
  end
end