defmodule NameBadge do
  # Using if in this exercise instead of pattern matching is really awful
  def print(id, name, department) do
    printed_department = if department, do: String.upcase(department), else: "OWNER"

    if id do
      "[#{id}] - #{name} - #{printed_department}"
    else
      "#{name} - #{printed_department}"
    end
  end
end
