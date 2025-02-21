require_relative './edge_flow'
class HeavyGraph
  def initialize(num_size)
    @list_edge=[]
    @list_graph=[]
    @num_size=num_size
    @num_size.times do |num|
      @list_graph.push([])
    end
  end
  def add_edge(origin,destination,size)
    edge=EdgeFlow.new(origin,destination,size)
    @list_edge.push(edge)
    @list_graph[origin].push(edge)
  end
  def list_graph
    @list_graph
  end
  def adjacency(v)
    @list_graph[v]
  end
  def size_graph
    @num_size
  end
  def edge
    @list_edge
  end
end