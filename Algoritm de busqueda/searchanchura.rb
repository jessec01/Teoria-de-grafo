#importación
require_relative './graph'
class SearchAnchura
  def initialize(graph)
    @list_forest=[]
    @list_marked=[]
    @list_distance=[]
    @queue=[]
    @graph=graph
    inicialize_struct
    run_anchura(@graph,1)
  end
  def inicialize_struct
    @graph.num_size.times do |i|
      @list_forest.push(0)
      @list_distance.push(0)
      @list_marked.push(false)
    end
  end
  def run_anchura(graph,vertice)
    @list_distance[0]=0
    @queue.push(vertice)
    #print @queue.empty?
    while not @queue.empty?
      
      vertice_aux=@queue.shift
      #print vertice_aux 
      #retorna array de lista grafo
      graph.list_graph[vertice_aux].each do |element|
        if not @list_marked[element]
          print "#{element}-"
          @list_marked[vertice_aux]=true
          @list_distance[vertice_aux]=@list_distance[vertice_aux]+1
          @list_forest[vertice_aux]=vertice
          @queue.push(element)
        end
      end
    end
  end
end
