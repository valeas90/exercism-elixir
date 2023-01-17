defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  def generate(1), do: [2]
  def generate(2), do: [2, 1]

  def generate(length) when is_integer(length) and length > 2 do
    {2, 1}
    |> Stream.iterate(fn {left, right} -> {right, left + right} end)
    |> Stream.map(&elem(&1, 0))
    |> Enum.take(length)
  end

  def generate(_), do: raise(ArgumentError, "count must be specified as an integer >= 1")
end
