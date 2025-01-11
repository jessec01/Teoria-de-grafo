require_relative './graph'
require_relative './Primvoraz'
require_relative './dijkstra'
#require_relative './searchprof'
class Main
  def initialize(i,j)
    
    @graph=Graph.new(i,j,true)
    @graph_new=Graph.new(i,j,false) 
    @prim=PrimVoraz.new(@graph)
    value= @prim.resulting_tree
    value.size.times do |i|
      if i!=0
        @graph_new.add_edge(value[i].origin,value[i].destination,value[i].size)
      end
    end
    @graph_new.see_mesh
    puts ""
    #puts @graph_new.see_path_large
    @dijk=Dijkstra.new(@graph_new,@graph_new.see_path_large)
    print "destino: #{@graph_new.see_path_large} "
    puts ""
    #puts @dijk.path_a(@graph_new.see_path_large)
    puts @dijk.count_relax
    #@tree=@dijk.arbol_resultante
    count=0
   

    
    #@graph_new=@prim.arbol_resultante
    #@prim.arbol_resultante
    #@graph_new.see_mesh
    #print "#{@graph_new.size}"
    #@graph_new.see_graph
    
  end
end
object_argument=ARGV[0]
object_argument2=ARGV[1]
run_main=Main.new(object_argument,object_argument2)