defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &is_nil(&1.price))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn element ->
      %{element | name: String.replace(element.name, old_word, new_word)}
    end)
  end

  def increase_quantity(item, count) do
    updated =
      Enum.into(item.quantity_by_size, %{}, fn {size, amount} -> {size, amount + count} end)

    %{item | quantity_by_size: updated}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_size, amount}, acc -> acc + amount end)
  end
end
