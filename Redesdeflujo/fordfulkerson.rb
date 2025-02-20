require_relative './heavygraph'
require_relative './edge_flow'
class FordFulkerson
  def initialize(graph,font,drain)
    @flujo=0
    #@edge_flow=
    i=0
    is_true=true
    while is_true     
      puts "iteration:#{i}"
      i=i+1 
      @markup = Array.new(graph.size, false)
      @list_edge_flow=Array.new(graph.size, nil)
      path_to_Sumidero=[]
      value= Float::INFINITY
      f_minimun = rProf(graph, font, value);
      puts "fMinimo:#{f_minimun}"
      @drain=drain
      if @list_edge_flow[@drain] !== null
        edge_flow=@list_edge_flow[@drain]
        edge_flow.increase_flow(f_minimun,drain)
        path_to_Sumidero.push(edge_flow)
        @drain = edge_flow.origin == drain ? edge_flow.destination : edge_flow.origin
        path_to_Sumidero.each do |edge|
          puts edge
        end
      else 
        is_true=false
      end
    end
    print "flujo minimo encontrado:#{flujo}"   
    puts ""
    print "con #{i} iteracciones"
  end
  def r_prof(graph, value,f_minimun)
    @markup[value] = true
    new_flow_minimun = f_minimun
    graph.list_edge.each do |edge_flow|
      oposite_vertice =edge_flow.origin === value  ? edge_flow.destination : edge_flow.origin
      if @markup[oposite_vertice]
        residual capacity = edge_flow.residual_capacity(oposite_vertice)
        if residual_capacity>0
          if residual_capacity<new_flow_minimun
            new_flow_minimun=residual_capacity
            print "nuevo flujo minimo #{nuevoFlujoMinimo} en la arista #{arista}"
          end
          @list_edge_flow[oposite_vertice]=edge_flow
          new_flow_minimun=r_prof(graph,oposite_vertice,new_flow_minimun)
        end
      end 
    end
    return new_flow_minimun
  end
end