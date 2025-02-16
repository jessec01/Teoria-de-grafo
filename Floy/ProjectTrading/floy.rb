require_relative './graph'
class Floydwarshall
  def initialize(g)
    @mdist=Array.new(g.size_graph)
    @pi =Array.new(g.size_graph)
    @ctran=Array.new(g.size_graph)
    @mdist.size.times do |num|
      @mdist[num]=Array.new(g.size_graph,Float::INFINITY)
      @mdist[num][num]=0
      @pi[num]=Array.new(g.size_graph,nil)
      @ctran[num]=Array.new(g.size_graph,false)
      g.adjacency(num).each do |edge|
        value = -Math.log(edge.size_edge)
        #puts "Después de log: #{value}"
        #if value>0
          #value = value * -1.0
        #end
        #puts "Después de multiplicar por -1: #{value}"
        value = value.round(3)
        #puts "Después de round: #{value}"
        @mdist[edge.origin][edge.destination] = value
        @pi[edge.origin][edge.destination] = num
        @ctran[edge.origin][edge.destination] = true
      end
    end  
    print "Matriz initial"
    puts " "
    see_msdist
    puts " "
    @mdist.size.times do |k|
      @mdist.size.times do |i|
        @mdist.size.times do |j|
          if i !=k and j!=k
            if @mdist[i][j]>@mdist[i][k]+@mdist[k][j]
              @mdist[i][j]=@mdist[i][k]+@mdist[k][j]
              @pi[i][j]=@pi[k][j]
              #if k>3 #and k<4
                #print "Matriz modify: index:k->#{k} i->#{i} j->#{j}"
                #puts " "
                #see_msdist
              #end
            end
          #else
            #puts "@mdist[#{i}][#{j}]>@mdist[#{i}][#{k}]+@mdist[#{k}][#{j}]"
          end
          #puts "@mdist[#{i}][#{j}]>@mdist[#{i}][#{k}]+@mdist[#{k}][#{j}]"
          #if k<2
            #puts "@mdist[#{i}][#{j}]>@mdist[#{i}][#{k}]+@mdist[#{k}][#{j}]"
            #see_msdist
          #end
          @ctran[i][j]=@ctran[i][j]|| (@ctran[i][k] && @ctran[k][j])
        end  
      end
    end
    puts " "
  end
  def see_msdist
    @mdist.size.times do |k|
      @mdist.size.times do |i|
        print "#{@mdist[k][i].round(3)}..  "
      end
      puts " "
    end
    puts " "
  end
  def see_cycle
    list_value=[]
    @mdist.size.times do |k|
      @mdist.size.times do |i|
        if i==k
          list_value.push(@pi[k][i])
        end 
      end
    end

    list_value.size.times do |i|
      list_mark=Array.new(list_value.size,false)
      stop=false
      value=i
      #print "value: #{list_value[value]}-"
      while  !stop
        print "value: #{list_value[value]}-"
        if list_mark[list_value[value]]
          stop=true
        #end
        else
          
          list_mark[list_value[value]]=true
          value=list_value[value]
         
        end
        #list_mark[]=true

      end
      puts ""
    end
      print "sali"
  end
  def see_pi
    @mdist.size.times do |k|
      @mdist.size.times do |i|
        print "#{@pi[k][i]}"
      end
      puts " "
    end
  end
  def distance(v,w)
    @mdist[v][w]
  end
  def path(v,w,path_)
    if v==w
      path.push(v)  
      print "#{v}--"    
    else
      if @pi[v][w]==nil
        print "There is no path from #{v} to #{w}"

      else
        path(c,@pi[v][w],path)  
      end
    end
  end
  def pi
    @pi
  end
  def mdist
    @mdist
  end
end