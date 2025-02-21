require_relative './heavygraph'
require_relative './edge_flow'
class FordFulkerson
  def initialize(graph,font,drain)
    @flow=0
    #@edge_flow=
    i=0
    @count=0
    is_true=true
    while is_true     
      puts "iteration:#{i}"
      i=i+1 
      @markup = Array.new(graph.size_graph, false)
      @list_edge_flow=Array.new(graph.size_graph, nil)
      path_to_Sumidero=[]
      value= Float::INFINITY
      f_minimun = r_prof(graph, font, value);
      #return
      puts "fMinimo:#{f_minimun}"
      drain=drain
      if not @list_edge_flow[drain] == nil
        edge_flow=@list_edge_flow[drain]
        @flow=@flow+f_minimun
        path_to_Sumidero.push(edge_flow)
        drain = edge_flow.origin == drain ? edge_flow.destination : edge_flow.origin
        path_to_Sumidero.each do |edge|
          print "#{edge.origin}->"
          puts " "
        end
      else 
        is_true=false
        break
      end
    end
    print "flujo minimo encontrado:#{@flow}"   
    puts ""
    print "con #{i} iteracciones"
    puts ""
  end
  def r_prof(graph, value,f_minimun)
    @markup[value] = true
    new_flow_minimun = f_minimun
    
    # Iterar sobre las aristas adyacentes
    graph.list_graph[value].each do |edge_flow|
      oposite_vertice = edge_flow.origin == value ? edge_flow.destination : edge_flow.origin
      
      if not @markup[oposite_vertice]
        residual_capacity = edge_flow.residual_capacity(oposite_vertice)
        
        if residual_capacity > 0
          if residual_capacity < new_flow_minimun
            new_flow_minimun = residual_capacity
            #print "nuevo flujo minimo #{new_flow_minimun} en la arista #{edge_flow}"
            #puts ""
          end
          
          @list_edge_flow[oposite_vertice] = edge_flow
          new_flow_minimun = r_prof(graph, oposite_vertice, new_flow_minimun)
        end
      end 
    end
    
    return new_flow_minimun
  end
end