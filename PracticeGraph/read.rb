#importación
require_relative './graph'
#
class Read 
  def initialize(name_archive)
    @graph_dirigide=nil
    read_archive(name_archive)
    puts @graph_dirigide.list_graph.inspect

  end
  def read_archive(name_archive)
    
    #puts content.methods
    begin
      num_size=0
      num_vertices_end=0
      num_vertices_initial=0
      num_accountant=0
      File.open(name_archive) do |content|
        content.each_line do |linea|
          if num_accountant ==0
            num_size=/\d/.match(linea)
            @graph_dirigide=Graph.new(num_size[0].to_i)
            #puts num_size
        
          else
            num_vertices_initial=/\d/.match(linea).to_s
            #um_vertices_end=string_date
            num_vertices_end=/(?<=\d| )\d/.match(linea).to_s
            #puts num_vertices_end.class
            #puts num_vertices_initial.class
            @graph_dirigide.add_vertices(num_vertices_initial.to_i,num_vertices_end.to_i)
            #puts num_vertices_end
            #puts num_vertices_initial
            
          end
          
          num_accountant=num_accountant+1
        end
      end
      
      #content.each do |line|
        #
        #puts line
        #num_accountant=num_accountant+1
      #end
      
    rescue IOError =>e 
      puts "Error al intentar abrir el archivo"       
    end

  end
  def graph_dirigide
    @graph_dirigide
  end
end

