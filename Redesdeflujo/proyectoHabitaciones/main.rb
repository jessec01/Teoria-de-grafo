require_relative './fordfulkerson'
require_relative './read'
class Main
  def initialize(name_archive)
    @read_archive_main=Read.new(name_archive)
    @read_archive_main.graph_dirigide.transform_graph
    #puts @read_archive_main.graph_dirigide.adjacency(0).inspect
    #@read_archive_main.graph_dirigide.adjacency(0)
    #@read_archive_main.graph_dirigide.see_graph
    @for_f=FordFulkerson.new(@read_archive_main.graph_dirigide,@read_archive_main.graph_dirigide.base_size,
    @read_archive_main.graph_dirigide.base_size+1)
  end
end
object_argument=ARGV[0]
run_main=Main.new(object_argument)