defmodule BirdCount do
  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([_positive | tail]), do: has_day_without_birds?(tail)

  def total([]), do: 0
  def total(elements), do: total(elements, 0)
  def total([], acc), do: acc
  def total([amount | tail], acc), do: total(tail, amount + acc)

  def busy_days([]), do: 0
  def busy_days(elements), do: busy_days(elements, 0)
  def busy_days([], acc), do: acc
  def busy_days([amount | tail], acc) when amount >= 5, do: busy_days(tail, acc + 1)
  def busy_days([_amount | tail], acc), do: busy_days(tail, acc)
end
