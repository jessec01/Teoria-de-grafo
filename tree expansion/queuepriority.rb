class PriorityQueue
  def initialize(&comparator)
    @queue = []
    @comparator = comparator || ->(a, b) { a <=> b }
  end

  def push(element)
    @queue << element
    @queue.sort!(&@comparator)
  end

  def pop
    @queue.shift
  end

  def remove(element)
    @queue.delete(element)
    @queue.sort!(&@comparator)
  end

  def empty?
    @queue.empty?
  end

  def length
    @queue.length
  end
end
