class Edge 
  def initialize(origin,destination,size)
    @origin=origin
    @destination=destination
    @size=size
  end
  def a_xtreme
    return @origin
  end
  def extreme_oposite(number)
    if number==a_xtreme
      return @destination
    else
      return @origin
    end
  end
  def origin
    @origin
  end
  def destination
    @destination
  end
  def size
    @size
  end
end 