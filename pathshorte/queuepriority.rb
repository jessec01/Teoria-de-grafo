class PriorityQueue
  def initialize(&comparator)
    @queue = []
    @comparator = comparator || ->(a, b) { a <=> b }
  end
  def exist_value(v)
    if @queue.include?(v)
      return true
    end
    return false
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
