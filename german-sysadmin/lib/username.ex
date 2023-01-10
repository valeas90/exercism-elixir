defmodule Username do
  def sanitize(''), do: ''

  def sanitize([head | tail]) do
    letter =
      case head do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        char when char >= ?a and char <= ?z -> [char]
        ?_ -> '_'
        _ -> ''
      end

    letter ++ sanitize(tail)
  end
end
