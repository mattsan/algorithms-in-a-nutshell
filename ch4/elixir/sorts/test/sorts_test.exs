defmodule SortsTest do
  use ExUnit.Case
  doctest Sorts

  import Sorts

  describe "stack_sort" do
    test "sort numbers" do
      source = [15, 9, 8, 1, 4, 11, 7, 12, 13, 6, 5, 3, 16, 2, 10, 14]
      expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

      cmp = fn
        lhs, rhs when lhs < rhs -> -1
        lhs, rhs when lhs > rhs -> 1
        _, _ -> 0
      end

      assert stack_sort(source, cmp) == expected
    end

    test "sort strings" do
      source = ~w(one two three four five)
      expected = ~w(five four one three two)

      cmp = fn
        lhs, rhs when lhs < rhs -> -1
        lhs, rhs when lhs > rhs -> 1
        _, _ -> 0
      end

      assert stack_sort(source, cmp) == expected
    end

    test "sort complex numbers into absolute value" do
      source = [{2, 2}, {1, 1}, {2, 1}, {1, 2}, {3, 4}, {4, 3}]
      expected = [{1, 1}, {2, 1}, {1, 2}, {2, 2}, {3, 4}, {4, 3}]

      norm = fn {x, y} -> x * x + y * y end

      cmp = & norm.(&1) - norm.(&2)

      assert stack_sort(source, cmp) == expected
    end
  end
end
