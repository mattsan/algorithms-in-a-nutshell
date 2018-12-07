require 'minitest/autorun'
require './insertion_sort'

class TestInsertionSort < Minitest::Test
  def test_sorting_empty_array
    assert_equal [], InsertionSort([])
  end

  def test_sorting_16_element_array
    source = [15, 9, 8, 1, 4, 11, 7, 12, 13, 6, 5, 3, 16, 2, 10, 14]
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
    assert_equal expected, InsertionSort(source)
  end
end
