class EdgeFlow
  def initialize(origin,destination,capacity,flow)
    @origin=origin
    @destination=destination
    @flow=0
    @capacity=capacity
  end
  def origin
    @origin
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
  def increase_flow(destination)
end