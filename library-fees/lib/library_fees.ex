defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, struct} = NaiveDateTime.from_iso8601(string)
    struct
  end

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime
    |> NaiveDateTime.add(days * 3600 * 24, :second)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    returned = NaiveDateTime.to_date(actual_return_datetime)
    max(Date.diff(returned, planned_return_date), 0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    return = return |> datetime_from_string()
    planned_return_date = checkout |> datetime_from_string() |> return_date()

    discount = if monday?(return), do: 0.5, else: 1

    fee = days_late(planned_return_date, return) * rate * discount
    trunc(fee)
  end
end
