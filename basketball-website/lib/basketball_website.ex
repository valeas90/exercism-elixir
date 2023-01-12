defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    keys = String.split(path, ".")
    get(data, keys)
  end

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end

  defp get(data, []), do: data

  defp get(data, [head | tail]) do
    if is_nil(data[head]), do: nil, else: get(data[head], tail)
  end
end
