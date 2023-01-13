defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms) do
    get_combinations(tops, bottoms, into: [])
  end

  def get_combinations(tops, bottoms, options) do
    into = Keyword.get(options, :into, [])
    max_price = Keyword.get(options, :maximum_price, 100.00)

    for %{base_color: top_base_color, price: top_price} = top <- tops,
        %{base_color: bottom_base_color, price: bottom_price} = bottom <- bottoms,
        top_base_color != bottom_base_color,
        top_price + bottom_price < max_price,
        into: into,
        do: {top, bottom}
  end
end
