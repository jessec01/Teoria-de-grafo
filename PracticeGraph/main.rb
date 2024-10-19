require_relative './read'

class Main
  def initialize(name_archive)
    
    read_archive_main=Read.new(name_archive)

    #graph_main=Graph.new(read_archive_main)


  
  end
end
object_argument=ARGV[0]
run_main=Main.new(object_argument)