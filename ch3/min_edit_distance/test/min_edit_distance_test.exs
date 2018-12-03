defmodule MinEditDistanceTest do
  use ExUnit.Case
  doctest MinEditDistance

  describe "same length" do
    test "distance between ABC and ABC" do
      assert MinEditDistance.min_edit_distance("ABC", "ABC") == [
               [0, 1, 2, 3],
               [1, 0, 1, 2],
               [2, 1, 0, 1],
               [3, 2, 1, 0]
             ]
    end

    test "distance between ABC and XYZ" do
      assert MinEditDistance.min_edit_distance("ABC", "XYZ") == [
               [0, 1, 2, 3],
               [1, 1, 2, 3],
               [2, 2, 2, 3],
               [3, 3, 3, 3]
             ]
    end

    test "distance between ABC and ACE" do
      assert MinEditDistance.min_edit_distance("ABC", "ACE") == [
               [0, 1, 2, 3],
               [1, 0, 1, 2],
               [2, 1, 1, 2],
               [3, 2, 1, 2]
             ]
    end

    test "distance between blank and blank" do
      assert MinEditDistance.min_edit_distance("", "") == [[0]]
    end
  end
end
