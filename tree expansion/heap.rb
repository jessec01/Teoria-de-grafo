require_relative './edge'

class MinHeap
  def initialize
    @heap = []
  end

  def push(edge)
    @heap.push(edge)
    bubble_up(@heap.length - 1)
  end

  def pop
    return nil if @heap.empty?
    
    swap(0, @heap.length - 1)
    min = @heap.pop
    bubble_down(0)
    min
  end

  def peek
    @heap[0]
  end

  private

  def bubble_up(index)
    parent_index = (index - 1) / 2
    
    return if index <= 0
    return if @heap[parent_index].size <= @heap[index].size

    swap(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    left_child = 2 * index + 1
    right_child = 2 * index + 2
    smallest = index

    smallest = left_child if left_child < @heap.length && @heap[left_child].size < @heap[smallest].size
    smallest = right_child if right_child < @heap.length && @heap[right_child].size < @heap[smallest].size

    if smallest != index
      swap(index, smallest)
      bubble_down(smallest)
    end
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end
end
