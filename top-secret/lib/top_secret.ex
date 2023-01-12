defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({operation, _, args} = ast_node, acc)
      when operation in [:def, :defp] do
    {ast_node, [get_function_name(args) | acc]}
  end

  def decode_secret_message_part(ast_node, acc), do: {ast_node, acc}

  def decode_secret_message(string) do
    {_, acc} = string |> to_ast() |> Macro.prewalk([], &decode_secret_message_part/2)

    acc |> Enum.reverse() |> Enum.join("")
  end

  defp get_function_name([{_name, _, nil} | _tail]), do: ""

  defp get_function_name([{:when, _, args} | _tail]), do: get_function_name(args)

  defp get_function_name([{name, _, args} | _tail]) do
    arity = Enum.count(args)

    if arity > 0 do
      name
      |> Atom.to_string()
      |> String.slice(0..(arity - 1))
    else
      ""
    end
  end
end
