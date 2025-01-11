# Documentacion
class Graph
  def initialize(size)
    @list_graph=[]
    @size=size
  end
  def make_list_graph
    list_aux=[]
    size.downto(0) do |i|
      
      
      @list_graph<<list_aux
    end
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
    @size=size
  end
end

graph_bipartito = Graph.new(10)
graph_bipartito.make_list_graph