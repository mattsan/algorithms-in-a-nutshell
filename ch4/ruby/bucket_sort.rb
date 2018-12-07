require './insertion_sort'

class BucketSort
  def initialize(src)
    @src = src
  end

  def sort
    bucket = Array.new(@src.size) { [] }
    @src.each do |i|
      bucket[i / 3].push(i)
    end

    idx = 0
    bucket.each do |es|
      InsertionSort(es).each do |e|
        @src[idx] = e
        idx += 1
      end
    end
    @src
  end
end

def BucketSort(src)
  BucketSort.new(src).sort
end
