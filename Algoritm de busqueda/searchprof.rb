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
    print  graph.list_graph[0].element
    run_profundida(@graph,graph.list_graph[0].element)
  end 
  def inicialize_struct
    @graph.size.times do |i|
      @list_forest.push(0)
      @list_distance.push(0)
      @list_marked.push(false)
    end
  end
  def run_profundida(graph,vertice)
    @list_marked[vertice]=true
    list_graph.list_graph[vertice].each do |element|
      if not @list_marked[element]
        @list_forest[element]=vertice
        print element
        run_profundida(graph,element)
      end
    end
  end
end