#importación
require_relative './graph'
#
class SearchProf
  def initialize(graph)
    @list_forest=[]
    @list_marked=[]
    @list_distance=[]
    @graph=graph
    inicialize_struct
    print "1-"
    run_profundida(@graph,1)
  end 
  def inicialize_struct
    @graph.num_size.times do |i|
      @list_forest.push(0)
      @list_distance.push(0)
      @list_marked.push(false)
    end
  end
  def run_profundida(graph,vertice)
    #print "hola mundo"
    @list_marked[vertice]=true
    graph.list_graph[vertice].each do |element|
      if not @list_marked[element]
        @list_forest[element]=vertice
        print "#{element}-"
        run_profundida(graph,element)
      end
    end
  end
end