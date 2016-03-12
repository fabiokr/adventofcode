defmodule Aoc do
  def input(path) do
    File.read!(path)
    |> count
  end

  def count(path) do
    path
    |> String.split("")
    |> walk({0,0}, [{0,0}])
    |> Enum.uniq
    |> Enum.count
  end

  defp walk([h|t], current_position, accum) do
    next_position = walk_to(h, current_position)
    walk(t, next_position, accum ++ [next_position])
  end

  defp walk([], current_position, accum) do
    accum
  end

  defp walk_to("", {x,y}) do
    {x, y}
  end

  defp walk_to("\n", {x,y}) do
    walk_to("", {x,y})
  end

  defp walk_to(">", {x,y}) do
    {x + 1, y}
  end

  defp walk_to("<", {x,y}) do
    {x - 1, y}
  end

  defp walk_to("^", {x,y}) do
    {x, y + 1}
  end

  defp walk_to("v", {x,y}) do
    {x, y - 1}
  end
end
