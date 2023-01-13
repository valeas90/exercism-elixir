defmodule RPNCalculator do
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    try do
      result = operation.(stack)
      {:ok, result}
    rescue
      _error -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      result = operation.(stack)
      {:ok, result}
    rescue
      error -> {:error, error.message}
    end
  end
end
