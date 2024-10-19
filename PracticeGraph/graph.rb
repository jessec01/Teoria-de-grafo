# Documentacion
class Graph
  def initialize(num_size)
    @list_graph=[]
    @num_size=num_size
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
    @num_size=num_size
  end
end

