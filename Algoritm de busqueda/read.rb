#importación
require_relative './graph'
#
class Read 
  def initialize(name_archive)
    @graph_dirigide=nil
    read_archive(name_archive)
  end
  def read_archive(name_archive)
    begin

      num_size=0
      num_vertices_end=0
      num_vertices_initial=0
      num_accountant=0
      value_size=0
      File.open(name_archive) do |content|
        content.each_line do |linea|
          if num_accountant ==0
            num_size=/^\d{1,3}$/.match(linea).to_s
            #puts "eL"
            #puts num_size.size
            if num_size.size==1
              value_size=num_size
              #@graph_dirigide=Graph.new(value_size.to_i)
              #puts "Hola "
              #puts @graph_dirigide
            elsif num_size.size==2
              value_size=num_size[0]+num_size[1]
              #@graph_dirigide=Graph.new(value_size.to_i,)
              #puts "Hola "
              #puts @graph_dirigide
            elsif num_size.size==3
              value_size=num_size[0]+num_size[1]+num_size[2]
              #puts "Hola "
              #puts @graph_dirigide
            end
          elsif num_accountant==1
            value_read=/\d/.match(linea).to_s
            @graph_dirigide=Graph.new(value_size.to_i,value_read.to_i)
          else
            part=linea.split(" ")
            if part.length == 2 && part.all? { |part| part.match(/^\d{1,3}$/) }
              num_vertices_initial=part[0].to_i
              num_vertices_end=part[1].to_i
              #puts @graph_dirigide
              #puts "mundo"
              @graph_dirigide.add_vertices(num_vertices_initial,num_vertices_end)
            end  
          end
          num_accountant=num_accountant+1
        end
      end
    rescue IOError =>e 
      puts "Error al intentar abrir el archivo"       
    end
  end
  def read_archive_gv(name_archive)
    
      num_size=0
      num_vertices_end=0
      num_vertices_initial=0
      num_accountant=0
      begin 
        File.open(name_archive) do |content|
          content.each_line do |linea|
            if num_accountant ==0
              if /graph/.match(linea)
                puts "hola mundo"
              end
            elsif num_accountant ==1
              if /{/.match(linea)
                puts "hola world"
              end
            elsif num_accountant>1
              puts hola mundo
            end
          end
        end 
      rescue IOError =>e 
        puts "Error al intentar abrir el archivo"       
      end 
          
  end
  def graph_dirigide
    @graph_dirigide
  end
end

