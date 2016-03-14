defmodule Aoc do
  def input(path) do
    values = File.read!(path)
    |> String.split("\n")

    process(initial_square(1000), values)
    |> count
  end

  def count(square) do
    square
    |> Enum.map(fn(x) -> Enum.count(x, &(&1)) end)
    |> Enum.sum
  end

  def process(square, [h|t]) do
    process(action(square, h), t)
  end

  def process(square, []) do
    square
  end

  def initial_square(size) do
    for _ <- Enum.to_list(1..size) do
      for _ <- Enum.to_list(1..size), do: false
    end
  end

  defp action(square, action) do
    IO.puts "Processing '#{action}'"

    cond do
      String.starts_with?(action, "turn on") ->
        turn_on(square, extract_points(action, 8))
      String.starts_with?(action, "turn off") ->
        turn_off(square, extract_points(action, 9))
      String.starts_with?(action, "toggle") ->
        toggle(square, extract_points(action, 7))
      true ->
        square
    end
  end

  defp turn_on(square, points) do
    switch(square, points, fn (_) -> true end)
  end

  defp turn_off(square, points) do
    switch(square, points, fn (_) -> false end)
  end

  defp toggle(square, points) do
    switch(square, points, fn (e) -> !e end)
  end

  defp switch(square, [], _), do: square
  defp switch(square, [{x,y}|t], fun) do
    x_list = Enum.at(square, x)
    new_x_list = List.replace_at(x_list, y, fun.(Enum.at(x_list, y)))
    switch(List.replace_at(square, x, new_x_list), t, fun)
  end

  defp extract_points(action, split_at) do
    {_, p} = String.split_at(action, split_at)

    String.split(p, " through ")
    |> Enum.map(fn (e) ->
      String.split(e, ",")
      |> Enum.map(&String.to_integer/1)
    end)
    |> points_for
  end

  defp points_for([[a,b], [c,d]]) do
    for x <- Enum.to_list(a..c), y <- Enum.to_list(b..d), do: {x,y}
  end
end
