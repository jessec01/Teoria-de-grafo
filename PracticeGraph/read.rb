#importación
require_relative './graph'
#
class Read 
  def initialize(name_archive)
    read_archive(name_archive)
    #@graph_dirigide=nil
  end
  def read_archive(name_archive)
    content = File.read(name_archive)
    puts content
    begin
      num_size=0
      num_vertices_end=0
      num_vertices_initial=0
      num_accountant=0
      puts content[1]
      
      
      #content.each do |line|
        #string_str=/\d/.match(line)
        #puts line
        #num_accountant=num_accountant+1
      #end
      
    rescue IOError =>e 
      puts "Error al intentar abrir el archivo"       
    end

  end
end

