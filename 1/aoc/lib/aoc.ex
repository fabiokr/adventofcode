defmodule Aoc do
  def input(path) do
    floor(File.read!(path))
  end

  def floor(path) do
    _floor(String.split(path, ""), 0)
  end

  defp _floor([], sum) do
    sum
  end

  defp _floor([h|t], sum) do
    _floor(t, _floor(h) + sum)
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
