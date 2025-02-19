require_relative './floy'
require_relative './read'
class Main
  def initialize(name_archive)
    @read_archive_main=Read.new(name_archive)
    @floy=Floydwarshall.new(@read_archive_main.graph_dirigide)
    @floy.see_msdist
    @floy.see_pi
  end
end
object_argument=ARGV[0]
run_main=Main.new(object_argument)