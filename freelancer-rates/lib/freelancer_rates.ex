defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    minus = before_discount * discount / 100
    before_discount - minus
  end

  def monthly_rate(hourly_rate, discount) do
    (hourly_rate |> daily_rate() |> apply_discount(discount)) * 22 |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget / (hourly_rate |> daily_rate() |> apply_discount(discount)) |> Float.floor(1)
  end
end
