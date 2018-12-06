class HeapSort
  def initialize(array)
    @array = array
  end

  def sort
    (@array.size / 2 - 1).downto(0) {|i| heapify(i, @array.size) }

    (@array.size - 1).downto(1) {|i|
      @array[0], @array[i] = @array[i], @array[0]
      heapify(0, i)
    }
    @array
  end

  private

  def heapify(idx, max)
    largest = idx
    left = idx * 2 + 1
    right = idx * 2 + 2

    largest = left if left < max && @array[left] > @array[idx]
    largest = right if right < max && @array[right] > @array[largest]
    if largest != idx
      @array[idx], @array[largest] = @array[largest], @array[idx]
      heapify(largest, max)
    end
  end
end

def HeapSort(array)
  HeapSort.new(array).sort
end
