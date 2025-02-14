require_relative './edge'
class Graph
  attr_accessor :num_size
  def initialize(num_size)
    @list_edge=[]
    @list_graph=[]
    @num_size=num_size
    @num_size.times do |num|
      @list_graph.push([])
    end
  end
  def add_edge(origin,destination,size)
    edge=Edge.new(origin,destination,size)
    @list_edge.push(edge)
    @list_graph[origin].push(edge)
  end
  def list_graph
    @list_graph
  end
  def adjacency(v)
    @list_graph[v]
  end
  def size_graph
    @num_size
  end
  def edge
    @list_edge
  end
  def see_graph()
    @num_size.times do |element|
      #@list_graph[element].
      #print "hola"
      date2=@list_graph[element]
      #print date2
      date2.each do |date|
        print "@list_graph[#{element}]=#{date.origin} #{date.destination} #{date.size_edge} "
        puts 
      end
    end
  end
end