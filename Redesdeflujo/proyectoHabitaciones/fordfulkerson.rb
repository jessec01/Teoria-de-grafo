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
      #puts "iteration:#{i}"
      i=i+1 
      @markup = Array.new(graph.size_graph, false)
      @list_edge_flow=Array.new(graph.size_graph, nil)
      @queue=[]
      path_to_Sumidero=[]
      value= Float::INFINITY
      r_anchura(graph, font, value,drain);
      #print "#{@list_edge_flow.inspect}"
      #puts ""
      #return
      #puts "fMinimo:#{f_minimun}"
      drain=drain
      if not @list_edge_flow[drain] == nil
        #if value<@list_eged_flow[drain].capacity
          #value=@list_eged_flow[drain].capacity 
        #end
        edge_flow=@list_edge_flow[drain]
        @flow=@flow+edge_flow.capacity
        path_to_Sumidero.push(edge_flow)
        drain = edge_flow.origin == drain ? edge_flow.destination : edge_flow.origin
        #path_to_Sumidero.each do |edge|
          #print "#{edge.origin}->"
          #puts " "
        #end
      else 
        is_true=false
        break
      end
    end
    if @flow>graph.max_student
      print "False"
      puts ""
      print "Flujo maximo:#{@flow}"
      puts ""
    else
      print "True" 
      puts ""  
      print "Flujo maximo:#{@flow}"
      puts ""
    end 
    #print "flujo maximo encontrado:#{@flow}"   
    #puts ""
    #print "con #{i} iteracciones"
    #puts ""
  end
  def r_anchura(graph, value,f_minimun,sumidero)
    @queue.push(value)
    #@markup[value] = true
    new_flow_minimun = f_minimun
    while not @queue.empty?
      vertice_aux=@queue.shift
      #print "#{vertice_aux}"
      
      graph.adjacency(vertice_aux).each do |edge_flow|
        #print "arista:"
        #print "#{edge_flow.origin}"
        #puts ""
        oposite_vertice = edge_flow.origin == vertice_aux ? edge_flow.destination : edge_flow.origin
        #print "vertice a examinar:"
        #print "#{oposite_vertice}"
        #puts ""
        if not @markup[oposite_vertice]
          @markup[oposite_vertice]=true
          residual_capacity = edge_flow.residual_capacity(oposite_vertice)
          if residual_capacity > 0
            
            if residual_capacity < new_flow_minimun
              new_flow_minimun = residual_capacity
            end
            @list_edge_flow[oposite_vertice] = edge_flow
            #print "#{oposite_vertice}==#{sumidero}"
            if oposite_vertice==sumidero
              return
            else
              @queue.push(oposite_vertice)
            end
          end
        end
      end 
    end
    return
  end
end