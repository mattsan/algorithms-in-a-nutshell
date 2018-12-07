class InsertionSort
  def initialize(src)
    @src = src
  end

  def sort
    (1...@src.size).each do |pos|
      insert(@src, pos, @src[pos])
    end
    @src
  end

  private

  def insert(array, pos, value)
    i = pos - 1
    while i >= 0 && array[i] > value
      array[i + 1] = array[i]
      i -= 1
    end
    array[i + 1] = value
  end
end

def InsertionSort(src)
  InsertionSort.new(src).sort
end
