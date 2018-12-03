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
    cs1 = s1 |> String.to_charlist() |> :array.from_list()
    cs2 = s2 |> String.to_charlist() |> :array.from_list()
    len1 = :array.size(cs1)
    len2 = :array.size(cs2)

    m = Matrix.new(len1 + 1, len2 + 1)
    m = 0..len1 |> Enum.reduce(m, &Matrix.set(&2, &1, 0, &1))
    m = 0..len2 |> Enum.reduce(m, &Matrix.set(&2, 0, &1, &1))

    indices = for i <- 1..len1, j <- 1..len2, do: {i, j}

    indices
    |> Enum.reduce(m, fn {i, j}, m ->
      cost = if :array.get(i - 1, cs1) == :array.get(j - 1, cs2), do: 0, else: 1
      replaceCost = Matrix.get(m, i - 1, j - 1) + cost
      removeCost = Matrix.get(m, i - 1, j) + 1
      insertCost = Matrix.get(m, i, j - 1) + 1
      Matrix.set(m, i, j, Enum.min([replaceCost, removeCost, insertCost]))
    end)
    |> Matrix.to_list()
  end
end
