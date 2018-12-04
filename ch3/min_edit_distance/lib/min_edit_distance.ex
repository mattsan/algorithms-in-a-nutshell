defmodule MinEditDistance do
  @moduledoc """
  Documentation for MinEditDistance.
  """

  defmodule Matrix do
    defstruct row_size: 0, col_size: 0, entities: nil

    def new(row_size, col_size) do
      entities = :array.new(row_size * col_size)
      %Matrix{row_size: row_size, col_size: col_size, entities: entities}
    end

    def set(
          %Matrix{row_size: row_size, col_size: col_size, entities: entities} = matrix,
          row,
          col,
          value
        )
        when row < row_size do
      # IO.inspect [row, col, row * col_size + col, value, entities]
      %{matrix | entities: :array.set(row * col_size + col, value, entities)}
    end

    def get(%Matrix{row_size: row_size, col_size: col_size, entities: entities}, row, col)
        when row < row_size do
      :array.get(row * col_size + col, entities)
    end

    def to_list(%Matrix{col_size: col_size, entities: entities}) do
      entities
      |> :array.to_list()
      |> Enum.chunk_every(col_size)
    end
  end

  alias MinEditDistance.Matrix

  def min_edit_distance(s1, s2) do
    min_edit_distance_matrix(s1, s2)
    |> List.last()
    |> List.last()
  end

  def min_edit_distance_matrix(s1, s2) do
    min_edit_distance_and_operations(s1, s2) |> elem(0)
  end

  def min_edit_operations(s1, s2) do
    {ds, os} = min_edit_distance_and_operations(s1, s2)

    Enum.zip(ds, os)
    |> Enum.reverse()
    |> Enum.map(fn {d, o} ->
      Enum.zip(d, o) |> Enum.reverse()
    end)
    |> parse([])
    |> Enum.with_index(1)
    |> Enum.reject(fn
      {:nop, _} -> true
      _ -> false
    end)
  end

  defp parse([], acc), do: acc
  defp parse([[{_, :undefined}] | _], acc), do: acc

  defp parse([[{_, :remove} | _] | rest_row], acc) do
    parse(rest_row, [:remove | acc])
  end

  defp parse([[{_, :insert} | rest_col] | rest_row], acc) do
    parse([rest_col | Enum.map(rest_row, &Enum.drop(&1, 1))], [:insert | acc])
  end

  defp parse([ [{d, _} | _], [_, {d, _} = c | rest_col] | rest_row], acc) do
    parse([[c | rest_col] | Enum.map(rest_row, &Enum.drop(&1, 1))], [:nop | acc])
  end

  defp parse([_ | rest], acc) do
    parse(Enum.map(rest, &Enum.drop(&1, 1)), [:replace | acc])
  end

  defp min_edit_distance_and_operations(s1, s2) do
    cs1 = s1 |> String.to_charlist() |> :array.from_list()
    cs2 = s2 |> String.to_charlist() |> :array.from_list()
    len1 = :array.size(cs1)
    len2 = :array.size(cs2)

    m = Matrix.new(len1 + 1, len2 + 1)
    m = 0..len1 |> Enum.reduce(m, &Matrix.set(&2, &1, 0, &1))
    m = 0..len2 |> Enum.reduce(m, &Matrix.set(&2, 0, &1, &1))
    ops = Matrix.new(len1 + 1, len2 + 1)

    range1 = if len1 > 0, do: 1..len1, else: []
    range2 = if len2 > 0, do: 1..len2, else: []
    indices = for i <- range1, j <- range2, do: {i, j}

    {distance, ops} =
      indices
      |> Enum.reduce({m, ops}, fn {i, j}, {m, ops} ->
        cost = if :array.get(i - 1, cs1) == :array.get(j - 1, cs2), do: 0, else: 1
        replaceCost = Matrix.get(m, i - 1, j - 1) + cost
        removeCost = Matrix.get(m, i - 1, j) + 1
        insertCost = Matrix.get(m, i, j - 1) + 1
        {min, op} = [replaceCost, removeCost, insertCost] |> Enum.zip([:replace, :remove, :insert]) |> Enum.min()

        {Matrix.set(m, i, j, min), Matrix.set(ops, i, j, op)}
      end)

    {Matrix.to_list(distance), Matrix.to_list(ops)}
  end
end
