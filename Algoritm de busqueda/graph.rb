# Documentacion
class Graph
  def initialize(num_size)
    @num_size=num_size
    #@num_size.class
    @is_dirigide=is_dirigide
    @list_graph=Array.new(@num_size)
    @list_edge=[]
    @random_rand=Random.new()
    make_list_graph
    @list_marked=Array.new(@num_size)
    make_list_marked
    @num_accountant=0
    @list_vertices_with_element=[]
  end
  def is_dirigide
    is_dirigide_graph=true
    @num_size.times do |element|
      @list_graph[element].each do |date|
        if exist_edge(date,element) and exist_edge(element,date)
          is_dirigide_graph=false
        else
          return true
        end
      end
    end
    return false
  end    
  def exist_edge(num_vertice_a,num_vertice_b)
    @list_graph[num_vertice_a].include?(num_vertice_b)
  end  
  def add_vertices(vertice,edge)
    @list_graph[vertice].push(edge)
    if is_dirigide
      @list_graph[edge].push(vertice)
    end
  end
  def make_list_graph
    @num_size.times do |i|
      @list_graph[i]=Array.new(0)
    end
  end
  def see_graph
    @num_size.times do |element|
      @list_graph[element].each do |date|
        puts date
      end
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
end

