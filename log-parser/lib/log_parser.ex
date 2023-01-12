defmodule LogParser do
  def valid_line?(line) do
    String.match?(line, ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/)
  end

  def split_line(line) do
    String.split(line, ~r/<[~\*=-]*>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line(\d)+/i, "")
  end

  def tag_with_user_name(line) do
    capture = Regex.run(~r/User\s+(\S+)/, line)
    name = if capture, do: Enum.at(capture, 1)
    if name, do: "[USER] #{name} #{line}", else: line
  end
end
