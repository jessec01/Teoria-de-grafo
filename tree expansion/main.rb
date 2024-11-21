require_relative "./setdistinct"
class Main
  def initialize
    #print "hola"
    set_D=CDistinct.new(6)
    puts "Componente inicial: #{set_D.number}"
    set_D.union_speedQ(0,3)
    set_D.union_speedQ(3,2)
    set_D.union_speedQ(4,5)
    puts "componente final: #{set_D.number}"
  end 
end
run_main=Main.new()