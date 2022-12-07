defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_head | tail]) do
    tail
  end

  def first([head | _tail]) do
    head
  end

  def count(list) do
    # Enum.count(list)
    count(list, 0)
  end

  def functional_list?(list) do
    "Elixir" in list
  end

  defp count([], acc), do: acc

  defp count(list, acc) do
    count(remove(list), acc + 1)
  end
end
