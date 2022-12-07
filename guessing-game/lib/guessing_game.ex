defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  def compare(_secret_number, :no_guess), do: "Make a guess"
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when secret_number - guess > 1, do: "Too low"
  def compare(secret_number, guess) when guess - secret_number > 1, do: "Too high"
  def compare(_secret_number, _guess), do: "So close"
end
