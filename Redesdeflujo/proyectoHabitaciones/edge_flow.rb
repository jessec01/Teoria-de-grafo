class EdgeFlow
  def initialize(origin,destination,capacity)
    @origin=origin
    @destination=destination
    @flow=0
    @capacity=capacity
  end
  def origin
    @origin
  end
  def capacity
    @capacity
  end
  def destination
    @destination
  end
  def residual_capacity(destination)
    if destination==@destination
      return @capacity-@flow
    end
    return @flow
  end
  def increase_flow(destination,applied_flow)
    if destination==@des
      @flow=@flow+applied_flow    
    else
      @flow=@flow-applied_flow
    end
  end
end