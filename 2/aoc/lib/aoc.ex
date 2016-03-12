defmodule Aoc do
  def input(path) do
    File.read!(path)
    |> String.split("\n")
    |> Enum.map(&calculate/1)
    |> Enum.sum
  end

  def calculate("") do
    0
  end

  def calculate(value) do
    sides = _split(value)
            |> _sides
    Enum.sum(sides) + _smallest_side(sides)
  end

  defp _split(value) do
    String.split(value, "x")
    |> Enum.map(&String.to_integer/1)
  end

  defp _sides([l, w, h]) do
    [2*l*w, 2*w*h, 2*h*l]
  end

  defp _smallest_side(side) do
    side
    |> Enum.map(&(&1/2))
    |> Enum.min
  end
end
