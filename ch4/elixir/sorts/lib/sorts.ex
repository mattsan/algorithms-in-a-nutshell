defmodule Sorts do
  @moduledoc """
  Documentation for Sorts.
  """

  def insertion_sort(source, cmp), do: insertion_sort([], source, cmp)

  defp insertion_sort(result, [], _), do: result

  defp insertion_sort(lhs, [value | rhs], cmp) do
    next_lhs =
      case Enum.find_index(lhs, &(cmp.(&1, value) > 0)) do
        nil ->
          [value | Enum.reverse(lhs)]
          |> Enum.reverse()

        n ->
          List.insert_at(lhs, n, value)
      end

    insertion_sort(next_lhs, rhs, cmp)
  end

  def stack_sort(source, cmp), do: stack_sort([], source, cmp)

  defp stack_sort(lhs, [], _), do: lhs
  defp stack_sort([], [value | rhs], cmp), do: stack_sort([value], rhs, cmp)

  defp stack_sort([left | lhs], [right | rhs], cmp) do
    c = cmp.(left, right)

    cond do
      c < 0 -> stack_sort(lhs, [right, left | rhs], cmp)
      c > 0 -> stack_sort([right, left | lhs], rhs, cmp)
      true -> stack_sort([left, right | lhs], rhs, cmp)
    end
  end
end
