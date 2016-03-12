defmodule Aoc do
  def input(path) do
    floor(File.read!(path))
  end

  def floor(path) do
    String.split(path, "")
      |> Enum.map(&_floor/1)
      |> Enum.sum
  end

  defp _floor("(") do
    1
  end

  defp _floor(")") do
    -1
  end

  defp _floor("") do
    0
  end

  defp _floor("\n") do
    0
  end
end
