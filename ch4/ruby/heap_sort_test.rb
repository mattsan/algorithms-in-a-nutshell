require 'minitest/autorun'
require './heap_sort'

class TestHeapSort < Minitest::Test
  def test_sorting_empty_array
    assert_equal HeapSort([]), []
  end

  def test_sorting_an_element_array
    assert_equal HeapSort([1]), [1]
  end

  def test_sorting_6_element_array
    assert_equal HeapSort([8, 11, 9, 2, 10, 16]),  [2, 8, 9, 10, 11, 16]
  end

  def test_sorting_8_element_array
    assert_equal HeapSort([3, 1, 4, 1, 5, 9, 2, 6, 5]), [1, 1, 2, 3, 4, 5, 5, 6, 9]
  end

  def test_sorting_already_sorted_array
    assert_equal HeapSort([1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5]), [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5]
  end

  def test_sorting_string_array
    assert_equal HeapSort(%w(one two three four five)), %w(five four one three two)
  end
end
