defmodule TakeANumber do
  def start() do
    spawn(&machine/0)
  end

  defp machine(), do: machine(0)

  defp machine(number) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, number)
        machine(number)

      {:take_a_number, sender_pid} ->
        new_number = number + 1
        send(sender_pid, new_number)
        machine(new_number)

      :stop ->
        :ok

      _ ->
        machine(number)
    end
  end
end
