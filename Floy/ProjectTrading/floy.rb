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
        value=-1*Math.log(edge.size_edge)
        @mdist[edge.origin][edge.destination]=value.round(1)
        @pi[edge.origin][edge.destination]=num
        @ctran[edge.origin][edge.destination]=true
      end
    end  
    @mdist.size.times do |k|
      @mdist.size.times do |i|
        @mdist.size.times do |j|
          if @mdist[i][j]>@mdist[i][k]+@mdist[k][j]
            @mdist[i][j]=@mdist[i][k]+@mdist[k][j]
            @pi[i][j]=@pi[k][j]
          end
          @ctran[i][j]=@ctran[i][j]|| (@ctran[i][k] && @ctran[k][j])
        end  
      end
    end
    puts " "
  end
  def see_msdist
    @mdist.size.times do |k|
      @mdist.size.times do |i|
        print "#{@pi[k][i]}..  "
      end
      puts " "
    end
    puts " "
  end
  def see_pi
    @mdist.size.times do |k|
      @mdist.size.times do |i|
        print "#{@mdist[k][i].round(1)}--  "
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