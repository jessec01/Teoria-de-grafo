require_relative './graph'
require_relative './edge'


class BellmanFord
  def initialize(graph,destination)
    @markup = Array.new(graph.size, false)
    @dist_a = Array.new(graph.size, Float::INFINITY)
    @edge_a =Array.new(graph.size)
    @graph=Graph.new(graph.i,graph.j,false)
    @exist_cicle_negative=false
    @dist_a[0] = 0
    @queue=[]
    @markup[0]=true
    @count=0
    @count_relax=0
    @destination=destination
    @graph.list_graph.size.times do |date|
      @markup=Array.new(graph.size, false)
      @queue=[]
      @markup[0]=true
      @queue.push(0)
      #puts @graph.list_graph[0]
      value_v=0
      if date<destination
        while @queue.size>0
          value_v=@queue.shift
          
          @count_relax=@count_relax+1
          count=0
          @graph.list_edge.each do |edge|
            if relax(edge)
              count=count+1
            end
            if !@markup[edge.extreme_oposite]
              @markup[edge.extreme_oposite]=true
              @queue-push(edge.extreme_oposite)
            end
          end
          if count==0
            break
          end
        end
      end
    end
    @count=@count+@graph.list_edge.size 
    @graph.list_edge.each do |edge|
      if @dist_a[edge.extreme_oposite(edge.a_xtreme)]>@dist_a[edge.a_xtreme+edge.size]
        @exist_cicle_negative=true
      end
    end
    @exist_cicle_negative=false
  end
  def relax(edge)
    @count_relax=@count_relax+1
    if @dist_a[edge.extreme_oposite(edge.a_xtreme)]> @dist_a[edge.a_xtreme]+edge.size
      @dist_a[edge.extreme_oposite(edge.a_xtreme)]=@dist_a[a_xtreme]+edge.size
      @edge_a.push(edge) 
      return true
    end
    return false
  end
  def count_relax
    @count_relax
  end
  def resulting_tree
    @edge_a
  end
  def edge_a
    @edge_a
  end
  def dist_a
    @dist_a
  end
end