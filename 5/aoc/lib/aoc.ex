defmodule Aoc do
  def input(path) do
    File.read!(path)
    |> String.split("\n")
    |> Enum.count(&nice?/1)
  end

  def nice?(string) do
    three_vowels?(string) &&
      twice_in_a_row?(string) &&
      no_rejected?(string)
  end

  defp three_vowels?(string) do
    c = (Regex.scan(~r/[aeiou]/, string) || [])
        |> Enum.count
    c >= 3
  end

  defp twice_in_a_row?(string) do
    String.split(string, "")
    |> do_twice_in_a_row
  end

  defp do_twice_in_a_row([h|[]]) do
    false
  end

  defp do_twice_in_a_row([]) do
    false
  end

  defp do_twice_in_a_row([h|t]) do
    [th|_] = t
    h == th || do_twice_in_a_row(t)
  end

  defp no_rejected?(string) do
    !Regex.match?(~r/ab|cd|pq|xy/, string)
  end
end
