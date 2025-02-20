require_relative './fordfulkerson'

class Main
  def initialize(name_archive)
    @read_archive_main=Read.new(name_archive)
    @for_f=FordFulkerson.new(@read_archive_main.graph_dirigide)
  end
end
object_argument=ARGV[0]
run_main=Main.new(object_argument)