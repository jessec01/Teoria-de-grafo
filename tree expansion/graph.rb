require_relative './edge'
class Graph 
  attr_accessor :num_size
  def initialize(i,j,lleno)
    @i=i.to_i
    @j=j.to_i
    @num_size=@i*@j
    @random_rand=Random.new()
    @list_graph=[]
    @num_size.times do |i|
      @list_graph.push([])
    end
  
    @list_marked=Array.new(@num_size)
    if lleno 
      run_mesh(@i,@j)
    end
  end
  def add_edge(number_v,number_w,number_size)
    new_adge=Edge.new(number_v,number_w,number_size)
    @list_graph[number_v].push(new_adge)
    @list_graph[number_w].push(new_adge)
  end
  def exist_edge(num_vertice_a,num_vertice_b)
    list_edge=@list_graph[num_vertice_a]
    list_edge.each do |element|
      if element.a_xtreme==num_vertice_b or element.extreme_oposite(num_vertice_a)==num_vertice_b
        return true
      end
    end
    return false
    #@list_graph[num_vertice_a].include?(num_vertice_b)
  end 
  def see_graph()
    @num_size.times do |element|
      #@list_graph[element].
      #print "hola"
      date2=@list_graph[element]
      #print date2
      date2.each do |date|
        print "@list_graph[#{element}]=#{date.extreme_oposite(element)} #{date.a_xtreme} #{date.size} "
        puts 
      end
    end
  end
  def list_edge()
    list_edge=[]
    @num_size.times do |element|
      date2=@list_graph[element]
      date2.each do |date|
        if element==date.a_xtreme
          list_edge.push(date)
        end
      end
    end
    return list_edge
  end
  def run_mesh(i,j)
    imax=i
    jmax=j
    imax.times do |i|
      jmax.times do |j|
        pos=(i*jmax)+j
        #puts pos
        if pos <jmax
          if j!=0 and j!=jmax-
            num_size_path=@random_rand.rand(1000)
            add_edge(pos  ,pos-1,num_size_path)
          elsif j==jmax-1
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-1,num_size_path)
          end
        elsif pos>=jmax and pos<(jmax*imax)-jmax
          if j==0
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-jmax,num_size_path)
          elsif j!=0 and j!=jmax-1
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-1,num_size_path)
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-jmax,num_size_path)
          elsif j==jmax-1
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-1,num_size_path)
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-jmax,num_size_path)
          end
        elsif pos>=(imax*jmax)-jmax
          if j==0
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-jmax,num_size_path)
          elsif j!=0 and j!=jmax
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-1,num_size_path)
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-jmax,num_size_path)
          elsif j==jmax-1
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-1,num_size_path)
            num_size_path=@random_rand.rand(1000)
            add_edge(pos,pos-imax+1,num_size_path)
          end
        end
      end 
    end
  end 
  def i
    @i
  end
  def j
    @j
  end
  def list_graph
    @list_graph
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
            print "#{@list_graph[pos].size}"
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
  def size
    @num_size
  end
end 