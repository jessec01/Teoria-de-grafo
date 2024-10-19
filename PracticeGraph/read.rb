#importación
require_relative './graph'
#
class Read 
  def initialize(name_archive)
    read_archive(name_archive)
    #@graph_dirigide=nil
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
            #puts num_size
        
          else
            string_date=/\d\s\d/.match(linea)
            num_vertices_initial=string_date[0]
            num_vertices_end=string_date[3]
            puts num_vertices_end
            puts num_vertices_initial
            
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
end

