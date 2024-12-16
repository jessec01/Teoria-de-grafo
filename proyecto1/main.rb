require_relative './graph'
require_relative './searchanchura'
require_relative './searchprof'
class Main
  def initialize(i,j)
    @graph=Graph.new(i,j,true)
    #@graph.see_graph
    @searchprof=SearchProf.new(@graph)
    @graph_new=@searchprof.graph_new
    #@graph_new.see_graph
    @graph_new.see_mesh
    #@read_archive_main=Read.new(name_archive)
    @searchanchura=SearchAnchura.new(@graph_new)
    @searchanchura.see_path_large
    #puts ""  
    #@searchprof=SearchProf.new(@read_archive_main.graph_dirigide)
    #read_archive_main.graph_dirigide.see_graph
    #puts read_archive_main.graph_dirigide.is_dirigide
    #read_archive_main.graph_dirigide.to_make_path_random
  end
end
object_argument=ARGV[0]
object_argument2=ARGV[1]
run_main=Main.new(object_argument,object_argument2)