require 'minitest/autorun'
require './heap_sort'

class TestHeapSort < Minitest::Test
  def test_sorting_empty_array
    assert_equal [], HeapSort([])
  end

  def test_sorting_an_element_array
    assert_equal [1], HeapSort([1])
  end

  def test_sorting_6_element_array
    source = [8, 11, 9, 2, 10, 16]
    expected = [2, 8, 9, 10, 11, 16]
    assert_equal expected, HeapSort(source)
  end

  def test_sorting_8_element_array
    source = [3, 1, 4, 1, 5, 9, 2, 6, 5]
    expected = [1, 1, 2, 3, 4, 5, 5, 6, 9]
    assert_equal expected, HeapSort(source)
  end

  def test_sorting_already_sorted_array
    source = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5]
    expected = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5]
    assert_equal expected, HeapSort(source)
  end

  def test_sorting_string_array
    source = %w(one two three four five)
    expected = %w(five four one three two)
    assert_equal expected, HeapSort(source)
  end
end
