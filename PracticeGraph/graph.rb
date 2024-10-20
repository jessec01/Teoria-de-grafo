# Documentacion
class Graph
  def initialize(num_size)
    @num_size=num_size
    #@num_size.class
    @list_graph=Array.new(@num_size)
    make_list_graph
  end
  def add_vertices(vertice,edge)
    #make_list_graph
    puts vertice
    puts edge
    @list_graph[vertice] << edge
    @list_graph.inspect
    is_dirigide=0
    if is_dirigide==1
      #@list_graph.insert(edge,vertice)
    end
  end
  def make_list_graph
    @num_size.times do |i|
      @list_graph[i]=Array.new(0)
    end
    #puts @list_graph.inspect
  end
  #getter 
  def  list_graph
    @list_graph
  end
  #getter 
  def size
    @size
  end
  #setter 
  def size=(size)
    @num_size=num_size
  end
end

