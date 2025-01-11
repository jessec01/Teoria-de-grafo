# Documentacion
class Graph
  def initialize(num_size)
    @num_size=num_size
    #@num_size.class
    @list_graph=Array.new(@num_size)
    @list_edge=[]
    @random_rand=Random.new()
    make_list_graph
    @list_marked=Array.new(@num_size)
    make_list_marked
    @num_accountant=0
    @list_vertices_with_element=[]
  end
  def analize_vetices
    @num_size.times do | element|
      if not @list_graph[element].size==0
        @list_vertices_with_element.push(element)
      end
    end
    #puts @list_vertices_with_element
  end
  def search_edge(string_edge)
    @list_edge.each do |date|
      if date==string_edge
        return true
      end
      return false
    end
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
  end
  def make_list_marked
    @num_size.times do |i|
      @list_marked[i]=false
    end
  end 
  def make_list_graph
    @num_size.times do |i|
      @list_graph[i]=Array.new(0)
    end
  end
  def to_make_path_random()
    num_size_path=@random_rand.rand(@num_size)
    analize_vetices
    num_vertices_initial= @random_rand.rand(@list_vertices_with_element.size)
  
    #puts "valor: #{@list_vertices_with_element[num_vertices_initial]}"
    #puts "size:#{@num_size}"
    #puts "list_graph[#{num_vertices_initial}].size:#{@list_graph[num_vertices_initial].size}"
    print "#{@list_vertices_with_element[num_vertices_initial]} ->"
    run_path_random(@list_vertices_with_element[num_vertices_initial],num_size_path,@list_graph) 
  end
  def see_graph
    @num_size.times do |element|
      @list_graph[element].each do |date|
        puts date
      end
    end
  end
  def modify_edge_random(list_graph)
    size=list_graph.size
    list_graph_new=[]
    #puts list_graph_new
    list_select=[]
    size.times do |i|
      list_select.push(i)
    end
    size.times do |element|
      value=@random_rand.rand(size)
      list_graph_new.push(list_select[value])
      aux=list_select[value]
      list_select[value]=list_select[size-1]
      list_select[size-1]=aux
      size=size-1
    end
    #puts list_graph_new.inspect
    return list_graph_new
  end 
  def run_path_random(vertice,size_path,list_graph)
    num_vertice=vertice
    num_size_path=size_path
    string_edge= ''
    #is_element
    #puts list_graph[num_vertice].size
    if list_graph[num_vertice].size==0
      return
    else 
      list_graph=modify_edge_random(list_graph[num_vertice])
      #return 
      #list_graph=modify_edge_random(list_graph)
      #puts list_graph.inspect
      #return
      list_graph.each do |element|
        if not @list_marked[element]
          @num_accountant=@num_accountant+1
          @list_marked[element]=true 
          if @list_edge.empty?
            #puts "hola mundo"
            string_edge=vertice.to_s+"->"+element.to_s
            if list_graph[element].size==0
              print "#{element}"
              return
            else
              print "#{element}"
            end
            @list_edge.push(string_edge)
            run_path_random(element,num_size_path,list_graph)
            
          else 
            if not search_edge(string_edge)
              string_edge=vertice.to_s+"->"+element.to_s 
              print "->#{element}"
              @list_edge.push(string_edge)
              if @num_accountant<num_size_path
                run_path_random(element,num_size_path,list_graph)
              end
            end
          end
        end
      end
    end
  end
  #getter 
  def  list_graph
    @list_graph
  end
  #getter 
  def num_size
    @size
  end
end

