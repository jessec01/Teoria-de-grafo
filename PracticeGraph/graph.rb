# Documentacion
class Graph
  def initialize(num_size)
    @num_size=num_size
    #@num_size.class
    @list_graph=Array.new(@num_size)
    
    @random_rand=Random.new()
    make_list_graph
    #puts @list_graph.inspect
    #is_dirigide
    #exist_edge(2,3)
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
    #make_list_graph
    #puts vertice
    #puts edge
    @list_graph[vertice].push(edge)
    #puts @list_graph.inspect
    is_dirigide=0
    if is_dirigide==1
      #@list_graph.insert(edge,vertice)
    end
  end
  def make_list_graph
    #@num_size=4
    @num_size.times do |i|
      @list_graph[i]=Array.new(0)
    end
    #puts @list_graph.inspect
  end
  def to_make_path_random()
    num_size_path=@random_rand.rand(@num_size)
    num_vertices_initial=2 #@random_rand.rand(@num_size)
    num_accountant=0
    puts num_vertices_initial
    #begin 
    run_path_random(num_vertices_initial,num_accountant,num_size_path,@list_graph)
    #rescue NoMethodError => e
      #puts "Error: #{e.message}"
    #end
  end
  def see_graph
    @num_size.times do |element|
      @list_graph[element].each do |date|
        puts date
      end
    end
  end
  def run_path_random(vertice,num_accountant,size_path,list_graph)
    vertice=vertice
    #puts list_graph[1].inspect
    list_graph.each do |element|
      if num_accountant !=size_path
        num_accountant=num_accountant+1
        puts element

        run_path_random(element,num_accountant,size_path,list_graph)
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
  #setter 
  def size=(size)
    @num_size=num_size
  end
end

