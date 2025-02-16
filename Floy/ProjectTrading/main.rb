
require_relative './read'
require_relative './floy'
class Main
  def initialize(name_archive)
    @read_archive_main=Read.new(name_archive)
    #@read_archive_main.graph_dirigide.see_graph
    @floy=Floydwarshall.new(@read_archive_main.graph_dirigide)
    @floy.see_msdist
    @floy.see_pi
    @floy.see_cycle
    #@floy.path(0,4,)
  end
end
object_argument=ARGV[0]
run_main=Main.new(object_argument)