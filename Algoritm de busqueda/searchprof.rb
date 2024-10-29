#importación
require_relative './graph'
#
class SearchProf
  def initialize(graph)
    @list_forest=[]
    @list_marked=[]
    @list_distance=[]
    @list_distance_f=[]
    @graph=graph
    @list_edge=[]
    @time=0
    @num_back_edge=0
    @num_tree_edge=0
    @num_forward_edge=0
    @num_cros_edge=0
    inicialize_struct
    aux=@graph.list_graph[0]
    print  "#{aux[0]}-"
    @graph.list_graph.size.times do |i|
      run_profundida(@graph,i)
    end
  end 
  def inicialize_struct
    @graph.num_size.times do |i|
      @list_forest.push(nil)
      @list_distance.push(0)
      @list_distance_f.push(0)
      @list_marked.push(0)
    end
  end
  def search_edge(string_edge)
    #print  @list_edge.size
    if not @list_edge.empty?
      @list_edge.size.times do |date|
        #print "#{@list_edge[date]}==#{string_edge} \n"
        if @list_edge[date]==string_edge
          return true
        end
        
      end
      return false
    end
  end
  def run_profundida(graph,vertice)
    @time=@time+1
    @list_distance[vertice]=@time
    @list_marked[vertice]=1
    #print "hola mundo"
    graph.list_graph[vertice].each do |element|
      if @list_marked[element]==0
        @list_forest[element]=vertice 
        string_edge=vertice.to_s+"->"+element.to_s
        #print string_edge
        @num_tree_edge=@num_tree_edge+1
        print "Tree edge #{vertice}-->#{element}" 
        @list_edge.push(string_edge) 
        run_profundida(graph,element)
      else
        string_edge=vertice.to_s+"->"+element.to_s
        #print "#{@list_edge}==#{string_edge} \n"
        #search_edge(string_edge)
        if not search_edge(string_edge)
          if @list_distance[vertice]>@list_distance[element] and @list_distance_f[vertice]< @list_distance_f[element]
            print "back edge #{vertice}-->#{element}"
            @list_edge.push(string_edge)
          elsif @list_distance[vertice]<@list_distance[element] and @list_distance_f[vertice]>@list_distance_f[element]
            print "Forward edge  #{vertice}-->#{element}"
            #string_edge=vertice.to_s+"->"+element.to_s
            @list_edge.push(string_edge)
          elsif @list_distance[vertice]>@list_distance[element] and @list_distance_f[vertice]>@list_distance_f[element]
            print "Cross edge  #{vertice}-->#{element}"
            #string_edge=vertice.to_s+"->"+element.to_s
            @list_edge.push(string_edge)
          end
        end
      end
    @list_marked[vertice]=2
    @time=@time+1
    @list_distance_f[vertice]=@time
    end
  end
end