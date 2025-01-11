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
    @origen=0
    @sum_vertice=0
    @queue_vertice=[]
    inicialize_struct
    run_anchura(@graph,@origen)
    
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
  def see_path_large 
    list_vertice_aux=[]
    @graph.size.times do |i|
      if @graph.list_graph[i].size==1 and i!=0
        list_vertice_aux.push(i)
      end
    end
    sum_aux=0
    vertice_origen_large=0
    puts "\n"
    list_vertice_aux.size.times do |i|
      #print list_vertice_aux[i]
      #puts "--"
      @queue_vertice=[]
      @sum_vertice=calcule_path_modify(list_vertice_aux[i])
      #print "#{@queue_vertice.size} "
     # @sum_vertice=@queue_vertice.size
      #@queue_vertice=nil
      #print @sum_vertice
      #puts "--"
      if @sum_vertice>sum_aux
        #print "hola"
        sum_aux=@sum_vertice
        #@sum_vertice=0
        vertice_origen_large=list_vertice_aux[i]
        #print vertice_origen_large
        #puts "--"
      end
    end
    #@list_forest.size.times do |i|
      #print "#{@list_forest[i]}-"
    #end
    #puts "ll"
    #puts @sum_vertice
    #@queue_vertice=[]
    puts sum_aux+1

    see_path_large_intern(vertice_origen_large)
    #@sum_vertice
  end
  def see_path_large_intern(vertice)
    if vertice==@origen
      print "#{@origen} "
      #@queue_vertice.push(vertice)
    else
      if @list_forest[vertice]==nil
        print "empty"
      else
        see_path_large_intern(@list_forest[vertice])
        #@queue_vertice.push(vertice)
        print "#{vertice} "
      end
    end
  end
  def calcule_path_modify(vertice)
    number=vertice
    size_path=0
    while number!=@origen 
      size_path=size_path+1
      number=@list_forest[number]
    end
    return size_path
  end
  def calcule_path(vertice)
    #print "#{vertice}--"
    if vertice==@origen
      #@sum_vertice=@sum_vertice+1
      @queue_vertice.push(vertice)

    else
      if @list_forest[vertice]!=nil 
        #@sum_vertice=@sum_vertice+1
        #print @sum_vertice
        @queue_vertice.push(vertice)
        calcule_path(@list_forest[vertice])
      

      end
    end
  end
  def inicialize_struct
    @graph.size.times do |i|
      @list_forest.push(nil)
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
          @list_forest[element
          ]=vertice_aux
          @queue.push(element)
        end        
      @list_marked[vertice_aux]=2
      end
    end
  end
end
