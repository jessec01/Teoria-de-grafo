require_relative './graph'
require_relative './edge'
require_relative './heap'
require_relative './queuepriority' # Asegúrate de tener una implementación de cola de prioridad en Ruby

class NodoCola
  attr_accessor :v, :dist

  def initialize(v, dist = Float::INFINITY)
    @v = v
    @dist = dist
  end
end

class PrimVoraz
  def initialize(grafo)
    @marcados = Array.new(grafo.size, false)
    @distA = Array.new(grafo.size, Float::INFINITY)
    @aristaA =Array.new(grafo.size)
    @cola = PriorityQueue.new { |a, b| a.dist <=> b.dist }
    @graph=Graph.new(grafo.i,grafo.j,false)
    @distA[0] = 0
    @cola.push(NodoCola.new(0, 0))
    while !@cola.empty?
      nodo = @cola.pop
      visitar(grafo, nodo.v)
    end
  end
  def visitar(grafo, v)
    @marcados[v] = true
    grafo.list_graph[v].each do |arista|
      w = arista.extreme_oposite(v)
      #print w
      #puts " "
      if @marcados[w]==false
        if arista.size < @distA[w]
          @aristaA[w]=arista
          @distA[w] = arista.size
          @cola.remove(NodoCola.new(w))
          @cola.push(NodoCola.new(w, @distA[w]))
        end
     end
    end
  end
  def arbol_resultante
    @aristaA
  end
  def graph_new
    @graph
  end
  def peso
    return @aristaA.compact.reduce(0) { |suma, arista| suma + arista.size }
  end
end

