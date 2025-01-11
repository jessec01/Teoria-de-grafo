require_relative './read'

class Main
  def initialize(name_archive)
    
    read_archive_main=Read.new(name_archive)
    #read_archive_main.graph_dirigide.see_graph
    puts read_archive_main.graph_dirigide.is_dirigide
    read_archive_main.graph_dirigide.to_make_path_random
  end
end
object_argument=ARGV[0]
run_main=Main.new(object_argument)
