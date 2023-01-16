defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    alias RPNCalculator.Exception.StackUnderflowError
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      if value == [] do
        %StackUnderflowError{}
      else
        %StackUnderflowError{message: "stack underflow occurred, context: #{value}"}
      end
    end
  end

  @spec divide([number]) :: number
  def divide([]), do: raise(StackUnderflowError, "when dividing")
  def divide([_single_number]), do: raise(StackUnderflowError, "when dividing")
  def divide([0, _]), do: raise(DivisionByZeroError)
  def divide([divisor, dividend]), do: div(dividend, divisor)
end
