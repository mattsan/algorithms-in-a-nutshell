defmodule Sorts do
  @moduledoc """
  Documentation for Sorts.
  """

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
