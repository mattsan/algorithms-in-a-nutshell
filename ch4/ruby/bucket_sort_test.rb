require 'minitest/autorun'
require './bucket_sort'

class TestBucketSort < Minitest::Test
  def test_sorting_empty_array
    assert_equal BucketSort([]), []
  end

  def test_sorting_7_element_array
    source = [7, 5, 13, 2, 14, 1, 6]
    expected = [1, 2 ,5, 6, 7, 13, 14]
    assert_equal expected, BucketSort(source)
  end
end
