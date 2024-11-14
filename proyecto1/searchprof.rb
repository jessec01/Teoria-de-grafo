#importación
require_relative './graph'
#
class SearchProf
  def initialize(graph)
    @random_rand=Random.new()
    @list_forest=[]
    @list_marked=[]
    @list_distance=[]
    @list_distance_f=[]
    @graph=graph
    @graph_new=Graph.new(@graph.i,@graph.j,false)
    @list_edge=[]
    @time=0
    @num_back_edge=0
    @num_tree_edge=0
    @num_forward_edge=0
    @num_cros_edge=0
    #print @graph.size
    inicialize_struct
    #print  "#{aux[0]}-"-
    #@graph.see_graph
    #@graph.size.times do |i|
    run_profundida(@graph,0)
    #end
    #puts "profundidad"
    #puts "árbol:#{@num_tree_edge}"
    #puts "retorno: #{@num_back_edge}"
    #sum=@num_cros_edge+@num_forward_edge
    #puts "avance/cruzada:#{sum}" 

  end 
  def inicialize_struct
    @graph.size.times do |i|
      @list_forest.push(nil)
      @list_distance.push(0)
      @list_distance_f.push(0)
      @list_marked.push(false)
    end
  end
  def search_edge(string_edge)
    #print  @list_edge.size
    
    if not @list_edge.empty?
      #puts string_edge
      #puts "|"
      #puts @list_edge.inspect
      init=0
      final=@list_edge.size-1
      while init<=final 
        medium=(init+final)/2
        #print "#{@list_edge[medium]}-#{string_edge}---"
        if @list_edge[medium]==string_edge
          return true
        elsif @list_edge[medium]<string_edge
          init=medium+1
        else
          final=medium-1
        end
        
      end
      return false
    end
  end
  def modify_edge_random(list_graph)
    size=list_graph.size
    list_graph_new=[]
    #puts list_graph_new
    list_select=list_graph
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
  def run_profundida(graph,vertice)
    @time=@time+1
    @list_distance[vertice]=@time
    @list_marked[vertice]=true
    #print "hola mundo"
    list_graph_aux=graph.list_graph[vertice]
    #print list_graph_aux.inspect
    #puts "**"
    #list_graph_aux=graph.list_graph[vertice]
    list_graph_aux=modify_edge_random(list_graph_aux)
    #print list_graph_aux.inspect
    #puts "&&"
    list_graph_aux.each do |element|
      if not @list_marked[element]
        @list_marked[element]=true
        @list_forest[element]=vertice 
        string_edge=vertice.to_s+"->"+element.to_s
        @list_edge.push(string_edge)
        string_edge=element.to_s+"->"+vertice.to_s
        @list_edge.push(string_edge)
        #print "#{vertice}--#{element}**"
        @graph_new.add_vertices(vertice,element)
        run_profundida(graph,element)
      else
        string_edge=vertice.to_s+"->"+element.to_s
        if not search_edge(string_edge)
          @list_edge.push(string_edge)
          string_edge=element.to_s+"->"+vertice.to_s
          @list_edge.push(string_edge)
          #@graph_new.add_vertices(vertice,element)
          
        end
      end
      #@list_marked[vertice]=2
      @time=@time+1
      @list_distance_f[vertice]=@time
    end
  end
  def graph_new
    @graph_new
  end
end