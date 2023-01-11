defmodule DNA do
  @spec encode_nucleotide(integer) :: bitstring
  def encode_nucleotide(code) do
    case code do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      ?\s -> 0b0000
    end
  end

  @spec decode_nucleotide(integer) :: integer
  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      0b0000 -> ?\s
    end
  end

  def encode(dna) do
    encode(dna, "")
  end

  defp encode([], acc), do: acc

  defp encode([head | tail], acc) do
    encode(tail, <<acc::bitstring, encode_nucleotide(head)::size(4)>>)
  end

  def decode(dna) do
    decode(dna, '')
  end

  defp decode(<<>>, acc), do: acc

  defp decode(<<head::size(4), rest::bitstring>>, acc) do
    decode(rest, acc ++ [decode_nucleotide(head)])
  end
end
