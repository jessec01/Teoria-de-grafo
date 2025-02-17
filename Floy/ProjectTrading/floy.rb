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
   # print "Matriz initial"
    #puts " "
    #see_msdist
    #puts " "
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
          if @mdist[k][i]<0
            list_value.push(@pi[k][i])
          else
            print "No hay oportunidad de arbritaje"
            puts " "
            return #"No hay oportunidad de arbritaje"
          end
        end 
      end
    end
    account=0
    list_acccount=Array.new(list_value.size,0)
    list_value.size.times do |i|
      list_mark=Array.new(list_value.size,false)
      stop=false
      value=i
      #print "value: #{list_value[value]}-"
      while  !stop
        #print "value: #{list_value[value]}-"
        if list_mark[list_value[value]]
          stop=true
        #end
        else
          
          list_mark[list_value[value]]=true
          value=list_value[value]
          account=account+1
        end
      end
      list_acccount[i]=account
      #puts ""
    end
    value=0
    position=0
    
    list_acccount.size.times do |i|
      if list_acccount[i]>value
        position=i
        value=list_acccount[i]
      end
    end
    #print "position:#{position}"
    value=position
    value_total=1
    stop=false
    list_mark=Array.new(list_value.size,false)
    print "Oportunidad de Arbitraje:#{list_value[value]}->"
    initial=list_value[value]
    account=0
    while  !stop
      
      if initial!=list_value[value] and account>0
        print "#{list_value[value]}->"
      elsif  initial==list_value[value] and account>0
        print "#{list_value[value]}"
      end
      value_total=value_total*Math.exp(@mdist[list_value[value]][list_value[value]])
      if list_mark[list_value[value]]
        stop=true
      #end
      else       
        list_mark[list_value[value]]=true
        value=list_value[value]
        account=account+1
      end
      account=account+1
    end  
    puts
    print "Ganancia:#{value_total.round(3)}"
    puts " "
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