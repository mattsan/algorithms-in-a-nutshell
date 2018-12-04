defmodule MinEditDistanceTest do
  use ExUnit.Case
  doctest MinEditDistance

  import MinEditDistance

  describe "blank" do
    test "distance between blank and blank" do
      assert min_edit_distance_matrix("", "") == [[0]]
    end
  end

  describe "one side is an blank" do
    test "distance between ABC and blank" do
      assert min_edit_distance_matrix("ABC", "") == [[0], [1], [2], [3]]
    end

    test "distance between blank andd ABC" do
      assert min_edit_distance_matrix("", "ABC") == [[0, 1, 2, 3]]
    end
  end

  describe "same length" do
    test "distance between ABC and ABC" do
      assert min_edit_distance_matrix("ABC", "ABC") == [
               [0, 1, 2, 3],
               [1, 0, 1, 2],
               [2, 1, 0, 1],
               [3, 2, 1, 0]
             ]
    end

    test "distance between ABC and XYZ" do
      assert min_edit_distance_matrix("ABC", "XYZ") == [
               [0, 1, 2, 3],
               [1, 1, 2, 3],
               [2, 2, 2, 3],
               [3, 3, 3, 3]
             ]
    end

    test "distance between ABC and ACE" do
      assert min_edit_distance_matrix("ABC", "ACE") == [
               [0, 1, 2, 3],
               [1, 0, 1, 2],
               [2, 1, 1, 2],
               [3, 2, 1, 2]
             ]
    end
  end

  describe "general cases" do
    test "distance between ABC and CDEF" do
      assert min_edit_distance_matrix("ABC", "CDEF") == [
               [0, 1, 2, 3, 4],
               [1, 1, 2, 3, 4],
               [2, 2, 2, 3, 4],
               [3, 2, 3, 3, 4]
             ]
    end

    test "distance between Phoenix and Elixir" do
      assert min_edit_distance_matrix("Phoenix", "Elixir") == [
               [0, 1, 2, 3, 4, 5, 6],
               [1, 1, 2, 3, 4, 5, 6],
               [2, 2, 2, 3, 4, 5, 6],
               [3, 3, 3, 3, 4, 5, 6],
               [4, 4, 4, 4, 4, 5, 6],
               [5, 5, 5, 5, 5, 5, 6],
               [6, 6, 6, 5, 6, 5, 6],
               [7, 7, 7, 6, 5, 6, 6]
             ]
    end
  end
end
