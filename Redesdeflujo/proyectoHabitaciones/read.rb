#importación
require_relative './heavygraph'
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
      value_size_vertice=0
      value_aux=''
      is_firts=true
      File.open(name_archive) do |content|
        content.each_line do |linea|
          if num_accountant==0
            value_size=/^\d{1,3}$/.match(linea).to_s
          elsif num_accountant ==1
            size_vertice=/^\d{1,4}\s\d{1,4}$/.match(linea).to_s
          size_vertice.size.times do |i|
              if not size_vertice[i]==' ' and is_firts
                value_aux=value_aux+size_vertice[i]
              else
                is_firts=false
              end
            end
            if value_aux.size==1
              value_size_vertice=value_aux
            
              @graph_dirigide=HeavyGraph.new(value_size_vertice.to_i)
              #puts "Hola "
              #puts @graph_dirigide
            elsif value_aux.size==2
              value_size_vertice=value_aux[0]+value_aux[1]
              @graph_dirigide=HeavyGraph.new(value_size_vertice.to_i)
              #puts "Hola "
              #puts @graph_dirigide
            elsif value_aux.size==3
              value_size_vertice=value_aux[0]+value_aux[1]+value_aux[2]
              @graph_dirigide=HeavyGraph.new(value_size_vertice.to_i)  
              #puts "Hola "
              #puts @graph_dirigide
            end
          elsif num_accountant>=2
            part=linea.split(" ")
            if part.length == 2 && part.all? { |part| part.match(/^\d+$/)}
              num_vertices_initial=part[0].to_i
              num_vertices_end=part[1].to_i
              num_size=part[2].to_i
              #print "#{num_vertices_initial}--#{num_vertices_end} peso: #{num_size} "
              #puts @graph_dirigide
              #puts "mundo"
              #print "#{@graph_dirigide.inspect}"
              @graph_dirigide.add_edge(num_vertices_initial,num_vertices_end,value_size.to_i,true)
            end  
          end
          num_accountant=num_accountant+1
        end
      end
    
    rescue IOError=>e
      puts "Error al abrir el archivo"
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

