require_relative './../graph'
require_relative './../edge'
require_relative './../setdistinct'
require_relative './../heap'
class Kruskal 
  def initialize(graph)
    
    @list_edge=graph.list_edge
    @heap_edge=MinHeap.new()
    @list_edge.size.times do|date|
      @heap_edge.push(@list_edge[date])
    end
    end
    @queue_edge=[]
    @cddistinct=CDistinct.new(@list_edge.size)
    while @queue_edge.size <graph.size -1 and @heap_edge.size>0
      edge=@heap_edge.pop
      if !edge==nil
        num_v=edge.a_xtreme()
        num_w=edge.extreme_oposite()
        if !@cddistinct.connect(num_v,num_w)
          @cddistinct.union_speedQ(num_v,num_w)
          @queue_edge.push(edge)
        end
    end  
  end
  def tree_result()
    return @queue_edge
  end
   
end