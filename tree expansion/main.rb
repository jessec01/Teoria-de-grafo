require_relative './graph'
require_relative './Primvoraz'
#require_relative './searchanchura'
#require_relative './searchprof'
class Main
  def initialize(i,j)
    
    @graph=Graph.new(i,j,true)
    #@graph.see_graph
    #@graph.see_mesh
    @graph_new=Graph.new(i,j,false) 
    @prim=PrimVoraz.new(@graph)
    value= @prim.arbol_resultante
    value.size.times do |i|
      if i!=0
        @graph_new.add_edge(value[i].origin,value[i].destination,4)
      end
    end
    @graph_new.see_mesh
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