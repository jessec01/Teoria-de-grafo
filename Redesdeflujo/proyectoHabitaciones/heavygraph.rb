require_relative './edge_flow'
class HeavyGraph
  def initialize(num_size)
    @list_edge=[]
    @list_graph=[]
    @base_size=num_size
    @num_size=num_size+2
    @list_bedroom=[]
    @list_student=[]
    @num_size.times do |num|
      @list_graph.push([])
    end
  end
  def search_vertice(list,vertice)
    list_aux=list 
    init=0
    final=list_aux.size-1
    while init<=final 
      medium=(init+final)/2
      if list_aux[medium]==vertice
        return true
      elsif list_aux[medium]<vertice
        init=medium+1
      else
        final=medium-1
      end
    end
    return false
  end
  def add_edge(origin,destination,size,is_bipartito)
    edge=EdgeFlow.new(origin,destination,size)
    if is_bipartito
      if @list_student.size>0
        if not search_vertice(@list_student,origin)
          @list_student.push(origin)
        end
      else
        @list_student.push(origin)
      end
      if @list_bedroom.size>0
        if not search_vertice(@list_bedroom,destination)
          @list_bedroom.push(destination)
        end
      else
        @list_bedroom.push(destination)
      end
    end 
    @list_edge.push(edge)
    @list_graph[origin].push(edge)
  end
  def see_graph
    @list_graph.size.times do |i|
      if not list_graph[i].size ==0
        @list_graph[i].each do |date|
          puts "#{date.origin}-#{date.destination} capacidad:#{date.capacity}"
          puts ""
        end
      end
    end
  end
  def list_graph
    @list_graph
  end
  def edge_end(v)
    @list_graph[v]
  end
  def edge_star(v)
    list_edge_star=[]
    @list_graph.size.times do |i|
      @list_graph[i].each do |date|
        if date.destination==v
          list_edge_star.push(date)
        end 
      end
    end
    return list_edge_star
  end
  def extract_capacity
    capacity=0
    is_empty_capacity=false
    list_graph[0].each do |date|
      capacity=date.capacity
      if capacity>0
        is_empty_capacity=true
      end
      if is_empty_capacity
        return capacity
      end
      return capacity
    end 
  end
  def transform_graph
    capacity=extract_capacity
    @list_bedroom.each do |date|
      add_edge(date,@base_size+1,capacity,false)
    end
    @list_student.each do |date|
      add_edge(@base_size,date,capacity,false)
    end
  end
  def adjacency(v)
    list_edge_aux_end=[]
    list_edge_aux_star=[]
    list_edge_complete=[]
    list_edge_aux_end=edge_end(v)
    list_edge_aux_star=edge_star(v)
    list_edge_aux_end.each do |date|
      list_edge_complete.push(date)
    end
    #puts list_edge_aux_star.inspect
    list_edge_aux_star.each do |date|
      list_edge_complete.push(date)
    end
    return list_edge_complete
  end
  def max_student
    @list_student.size
  end
  def base_size
    @base_size
  end
  def size_graph
    @num_size
  end
  def edge
    @list_edge
  end
end