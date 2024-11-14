# Documentacion
class Graph
  def initialize(i,j,lleno)
    @i=i.to_i
    @j=j.to_i
    @num_size=@i*@j
    @list_graph=Array.new(@num_size)
    make_list_graph
    @list_marked=Array.new(@num_size)
    if lleno 
      run_mesh(@i,@j)
    end
  end    
  def exist_edge(num_vertice_a,num_vertice_b)
    @list_graph[num_vertice_a].include?(num_vertice_b)
  end  
  def add_vertices(vertice,edge)
    #puts "#{vertice}-#{edge}" 
    @list_graph[vertice].push(edge)
    @list_graph[edge].push(vertice)
  end
  def run_mesh(i,j)
    imax=i
    jmax=j
    imax.times do |i|
      jmax.times do |j|
        pos=(i*jmax)+j
        #puts pos
        if pos <jmax
          if j!=0 and j!=jmax-1
            @list_graph[pos].push(pos-1)
            @list_graph[pos-1].push(pos)
          elsif j==jmax-1
            @list_graph[pos].push(pos-1)
            @list_graph[pos-1].push(pos)
          end
        elsif pos>=jmax and pos<(jmax*imax)-jmax
          if j==0
            @list_graph[pos].push(pos-jmax)
            @list_graph[pos-jmax].push(pos)
          elsif j!=0 and j!=jmax-1
            @list_graph[pos].push(pos-1)
            @list_graph[pos-1].push(pos)
            @list_graph[pos].push(pos-jmax)
            @list_graph[pos-jmax].push(pos)
          elsif j==jmax-1
            @list_graph[pos].push(pos-1)
            @list_graph[pos-1].push(pos)
            @list_graph[pos].push(pos-jmax)
            @list_graph[pos-jmax].push(pos)
          end
        elsif pos>=(imax*jmax)-jmax
          if j==0
            @list_graph[pos].push(pos-jmax)
            @list_graph[pos-jmax].push(pos)
          elsif j!=0 and j!=jmax
            @list_graph[pos].push(pos-1)
            @list_graph[pos-1].push(pos)
            @list_graph[pos].push(pos-jmax)
            @list_graph[pos-jmax].push(pos)
          elsif j==jmax-1
            @list_graph[pos].push(pos-1)
            @list_graph[pos-1].push(pos)
            @list_graph[pos].push(pos-imax+1)
            @list_graph[pos-imax+1].push(pos)
          end
        end
      end 
    end
  end
  def see_mesh()
    imax=@i
    jmax=@j
    imax.times do |i|
      jmax.times do |j|
        pos=(i*jmax)+j
        #puts "*"
        #puts pos
        
        if pos <jmax
          if j==0
            if @list_graph[pos].size==0
              #print "  "
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos+1)
                print "╶"
              elsif exist_edge(pos,pos+jmax)
                print "╷"
              end
            elsif @list_graph[pos].size==2
              print "┌"
            end
          elsif  j!=0 and j!=jmax-1
            if @list_graph[pos].size==0
              #print " "
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos+1)
                print "╶"
              elsif exist_edge(pos,pos-1)
                print "╴"
              elsif exist_edge(pos,pos+jmax)
                print "╷"
              end
            elsif @list_graph[pos].size==2
              if exist_edge(pos,pos+1) and exist_edge(pos,pos-1)
                print "─"
              elsif exist_edge(pos,pos+jmax) and exist_edge(pos,pos+1)
                print "┌"
              elsif exist_edge(pos,pos+jmax) and exist_edge(pos,pos-1)
                print "┐"
              end
            elsif @list_graph[pos].size==3
              print "┬"
            end
          elsif j==jmax-1
            if @list_graph.size==0
              #print "  "
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos+jmax)
                print "╷"
                print "\n"
              elsif exist_edge(pos,pos-1)
                print "╴"
                print "\n"
              end
            elsif @list_graph[pos].size==2
              print "┐"
              print "\n"
            end
          end
        elsif  pos>=jmax and pos<(jmax*imax)-jmax
          if j==0
            if @list_graph[pos].size==0
              #print "  "
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos+1)
                print "╶"
              elsif exist_edge(pos,pos-jmax)
                print "╵"
              elsif exist_edge(pos,pos+jmax)
                print "╷"
              end
            elsif@list_graph[pos].size==2
              if exist_edge(pos,pos+jmax) and exist_edge(pos,pos+1)
                print "┌"
              elsif exist_edge(pos,pos+jmax) and exist_edge(pos, pos-jmax)
                print "│"
              elsif exist_edge(pos,pos-jmax) and exist_edge(pos,pos+1)
                print "└"
              end
            elsif @list_graph[pos].size==3
              print "├"
            end
          elsif j!=0 and j!=jmax-1 
            if @list_graph[pos].size==0
              print "  "
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos-1)
                print "╴"
              elsif exist_edge(pos,pos+1)
                print "╶"
              elsif exist_edge(pos,pos+jmax)
                print "╷"
              elsif exist_edge(pos,pos-jmax)
                print "╵"
              end
            elsif @list_graph[pos].size==2
              if exist_edge(pos,pos+1) and exist_edge(pos,pos-1)
                print "─"
              elsif exist_edge(pos,pos+1) and exist_edge(pos,pos+jmax)
                print "┌"
              elsif exist_edge(pos,pos+1) and exist_edge(pos,pos-jmax)
                print "└"
              elsif exist_edge(pos,pos-1) and exist_edge(pos,pos+jmax)
                print "┐"
              elsif exist_edge(pos,pos-1) and exist_edge(pos, pos-jmax)
                print "┘"
              elsif exist_edge(pos,pos+jmax) and exist_edge(pos,pos-jmax)
                print "|"
              end
            elsif @list_graph[pos].size==3
              if exist_edge(pos,pos+1) and exist_edge(pos,pos-1) and exist_edge(pos,pos+jmax)
                print "┬"
              elsif exist_edge(pos,pos+1)and exist_edge(pos,pos-jmax) and exist_edge(pos,pos-1)
                print "┴"
              elsif exist_edge(pos,pos+jmax) and exist_edge(pos,pos-jmax) and exist_edge(pos,pos-1)
                print "┤"
              elsif exist_edge(pos,pos+jmax) and exist_edge(pos, pos-jmax) and exist_edge(pos,pos+1)
                print "├"
              end
            elsif @list_graph[pos].size==4
              print "┼"
            end
          elsif j==jmax-1
            if @list_graph.size==0
              #print "  "
              #print "\n"
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos-1)
                print "╶"
                print "\n"
              elsif exist_edge(pos,pos-jmax)
                print "╵"
                print "\n"
              elsif exist_edge(pos,pos+jmax)
                print "╷"
                print "\n"
              end
            elsif @list_graph[pos].size==2
              if exist_edge(pos,pos-1) and exist_edge(pos,pos+jmax)
                print "┐"
                print "\n"
              elsif exist_edge(pos,pos-1) and exist_edge(pos,pos-jmax)
                print "┘"
                print "\n"
              elsif exist_edge(pos,pos-jmax) and exist_edge(pos,pos+jmax)
                print "│"
                print "\n"
              end
            elsif @list_graph[pos].size==3
              print "┤"
              print "\n"
            end
          end
        elsif pos>=(imax*jmax)-jmax
          if j==0
            if @list_graph[pos].size==0
              #prrint "  "
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos+1)
                print "╶"
              elsif exist_edge(pos,pos-jmax)
                print "╵"
              end
            elsif @list_graph[pos].size==2
              print "└"
            end
          elsif j!=0 and j!=jmax-1 
            if @list_graph[pos].size==0
              #print "  "
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos-1)
                print "╴"
              elsif exist_edge(pos,pos+1)
                print "╶"
              elsif exist_edge(pos,pos-jmax)
                print "╵"
              end
            elsif @list_graph[pos].size==2
              if exist_edge(pos,pos+1) and exist_edge(pos,pos-1)
                print "─"
              elsif exist_edge(pos,pos-1) and exist_edge(pos,pos-jmax)
                print "┘"
              elsif exist_edge(pos,pos+1) and exist_edge(pos,pos-jmax)
                print "└"
              end
            elsif @list_graph[pos].size==3
              print "┴"
            end
          elsif j==jmax-1
            if @list_graph.size==0
              #print "  "
            elsif @list_graph[pos].size==1
              if exist_edge(pos,pos-1)
                print "╴"
              elsif exist_edge(pos,pos-jmax)
                print "╵"
              end
            elsif @list_graph[pos].size==2
              print "┘"
            end
          end
        end
      end 
    end
  end
  def make_list_graph
    @num_size.times do |i|
      @list_graph[i]=Array.new(0)
    end
  end
  def see_graph
    @num_size.times do |element|
      @list_graph[element].each do |date|
        puts "#{element}->#{date}"
      end
    end
  end
  #getter 
  def  list_graph
    @list_graph
  end
  #getter 
  def size
    @num_size
  end
  def i 
    @i
  end
  def j
    @j
  end
  def is_dirigide
    @is_dirigide
  end
end

