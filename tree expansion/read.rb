#importación
require_relative './graph'
#
class Read 
  def initialize(name_archive)
    @graph_dirigide=nil
    read_archive(name_archive)
    #@graph_dirigide.see_graph
    puts @graph_dirigide.list_edge.inspect
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
            #puts num_size
            if num_size.size==1
              value_size=num_size
              @graph_dirigide=Graph.new(value_size.to_i)
              #puts "Hola "
              #puts @graph_dirigide
            elsif num_size.size==2
              value_size=num_size[0]+num_size[1]
              @graph_dirigide=Graph.new(value_size.to_i)
              #puts "Hola "
              #puts @graph_dirigide
            elsif num_size.size==3
              value_size=num_size[0]+num_size[1]+num_size[2]
              @graph_dirigide=Graph.new(value_size.to_i)  
              #puts "Hola "
              #puts @graph_dirigide
            end
          elsif num_accountant>=1
            part=linea.split(" ")
            if part.length == 3 && part.all? { |part| part.match(/^-?\d{1,3}$/) }
              num_vertices_initial=part[0].to_i
              num_vertices_end=part[1].to_i
              num_size=part[2].to_i
              #print "#{num_vertices_initial}--#{num_vertices_end} peso: #{num_size} "
              #puts @graph_dirigide
              #puts "mundo"
              @graph_dirigide.add_edge(num_vertices_initial,num_vertices_end,num_size)
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
      name_archive=name_archive
      num_size=0
      num_vertices_end=0
      num_vertices_initial=0
      num_accountant=0
      num_old=0
      begin 
        File.open(name_archive) do |content|
          content.each_line do |linea|
            if num_accountant>0
              #part=linea.split("->")
              #print part.length
              martch= ""
              #print "#{linea.match(/^(\d{3})->(\d{3});$/)}"
              
              martch1 = linea.match(/\d+/)
              martch=linea.match(/>([^;]+)/)|| linea.match(/-([^;]+)/)
              if martch!=nil and martch1!=nil 
                num_vertices_initial=martch1.to_s
                num_vertices_end=martch[1].to_s
                #print "#{num_old}>#{num_vertices_initial.to_i}"
                if num_vertices_initial.to_i>num_old
                  num_old=num_vertices_initial.to_i
                elsif num_vertices_end.to_i>num_old
                  num_old=num_vertices_end.to_i
                end
              end            
            end            
            num_accountant=num_accountant+1
          end
        end 
      rescue IOError =>e 
        puts "Error al intentar abrir el archivo"       
      end 
      begin
        num_accountant=0
        File.open(name_archive) do |content|
          content.each_line do |linea|
            if num_accountant==0
              string_type_graph=linea.match /\w*/
              if string_type_graph.to_s.eql?('graph')
                @graph_dirigide=Graph.new(num_old+1,1)
              elsif string_type_graph.to_s.eql?('digraph')
                @graph_dirigide=Graph.new(num_old+1,0) 
              end
            elsif num_accountant>0
              martch1 = linea.match(/\d+/)
              martch=linea.match(/>([^;]+)/)|| linea.match(/-([^;]+)/)
              if martch!=nil and martch1!=nil 
                num_vertices_initial=martch1.to_s
                num_vertices_end=martch[1].to_s
                @graph_dirigide.add_vertices(num_vertices_initial.to_i,num_vertices_end.to_i)

              end
            end
            num_accountant=num_accountant+1
          end
        end
      rescue IOError=>e
        puts "Error al abrir el archivo"
      end
    
  end
  def graph_dirigide
    @graph_dirigide
  end
end

