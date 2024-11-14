#importación
require_relative './graph'
class SearchAnchura
  def initialize(graph)
    @list_forest=[]
    @list_marked=[]
    @list_distance=[]
    @list_distance_f=[]
    @list_edge=[]
    @queue=[]
    @num_back_edge=0
    @num_tree_edge=0
    @num_forward_edge=0
    @num_cros_edge=0
    @graph=graph
    inicialize_struct
    @graph.list_graph.size.times do |i|
      run_anchura(@graph,i)
    end
    puts "anchura"
    puts "árbol:#{@num_tree_edge}"
    puts "retorno: #{@num_back_edge}"
    puts "avance/cruzada:#{@num_cros_edge}" 
    puts "\n"
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
  def inicialize_struct
    @graph.num_size.times do |i|
      @list_forest.push(0)
      @list_distance.push(0)
      @list_marked.push(0)
    end
  end
  def run_anchura(graph,vertice)
    @list_distance[vertice]=0
    @list_forest[vertice]=nil
    @queue.push(vertice)
    #print @queue.empty?
    while not @queue.empty?
      
      vertice_aux=@queue.shift
      aux=vertice_aux
      #print vertice_aux 
      #retorna array de lista grafo
      @list_marked[vertice_aux]=1
      #puts "vertice:#{vertice_aux}=#{graph.list_graph[vertice_aux].inspect}"
      graph.list_graph[vertice_aux].each do |element|
        if @list_marked[element]==0
          @list_marked[element]=1
          @list_distance[element]=@list_distance[vertice_aux]+1
          string_edge=vertice_aux.to_s+"->"+element.to_s
          #print "tree edge: #{vertice_aux}-->#{element}"
          @num_tree_edge=@num_tree_edge+1
          if graph.is_dirigide==0
            @list_edge.push(string_edge)
          else
            @list_edge.push(string_edge)
            string_edge=element.to_s+"->"+vertice_aux.to_s
            @list_edge.push(string_edge)
          end
          @list_forest[vertice_aux]=vertice
          @queue.push(element)
        else
          @list_distance[element]=@list_distance[vertice_aux]+1
          string_edge=vertice_aux.to_s+"->"+element.to_s
          if graph.is_dirigide==1
            if not search_edge(string_edge)
              #print "#{@list_distance[element]} >#{@list_distance[vertice_aux]}"
              if @list_distance[element] >@list_distance[vertice_aux]
                #print " Cross edge: #{element}-->#{vertice_aux}"
                @num_cros_edge=@num_cros_edge+1
                @list_edge.push(string_edge)
                string_edge=element.to_s+"->"+vertice_aux.to_s
                @list_edge.push(string_edge)
              end
            end
          else
            if not search_edge(string_edge)
              if @list_distance[element] > @list_distance[vertice_aux] 
                @num_back_edge=@num_back_edge+1
                #print " Back edge: #{element}-->#{vertice_aux}"
                @list_edge.push(string_edge)
              else
                @num_cros_edge=@num_cros_edge+1
                #print " Cross edge: #{element}-->#{vertice_aux}"
                @list_edge.push(string_edge)
              end
            end
          end
        end        
      @list_marked[vertice_aux]=2
      end
    end
  end
end
