defmodule Aoc do
  use Bitwise

  def input(path) do
    map = File.read!(path)
          |> String.split("\n")
          |> process(%{})

    map["a"]
  end

  def process([], map), do: map
  def process(values, map) do
    {new_values, new_map} = Enum.reduce(values, {values, map}, fn(operation, {v, m}) ->
      if new_m = wire(m, operation) do
        {List.delete(v, operation), new_m}
      else
        {v, m}
      end
    end)

    process(new_values, new_map)
  end

  def wire(map, operation) do
    wire_assign(map, operation) ||
      wire_and(map, operation) ||
      wire_or(map, operation) ||
      wire_lshift(map, operation) ||
      wire_rshift(map, operation) ||
      wire_not(map, operation) ||
      wire_empty(map, operation)
  end

  defp wire_empty(map, ""), do: map
  defp wire_empty(map, _), do: nil

  defp wire_assign(map, operation) do
    cond do
      (matches = Regex.named_captures(~r/\A(?<v>\d+) -> (?<gate>\w+)\z/, operation)) ->
        wire_map(map, matches["gate"], String.to_integer(matches["v"]))
      (matches = Regex.named_captures(~r/\A(?<l>\w+) -> (?<gate>\w+)\z/, operation)) && (l = map[matches["l"]]) ->
        wire_map(map, matches["gate"], l)
      true -> nil
    end
  end

  defp wire_and(map, operation) do
    cond do
      (matches = Regex.named_captures(~r/\A(?<l>\w+) AND (?<r>\w+) -> (?<gate>\w+)\z/, operation)) && (l = map[matches["l"]]) && (r = map[matches["r"]]) ->
        wire_map(map, matches["gate"], l &&& r)
      (matches = Regex.named_captures(~r/\A(?<l>\d+) AND (?<r>\w+) -> (?<gate>\w+)\z/, operation)) && (l = String.to_integer(matches["l"])) && (r = map[matches["r"]]) ->
        wire_map(map, matches["gate"], l &&& r)
      true -> nil
    end
  end

  defp wire_or(map, operation) do
    if (matches = Regex.named_captures(~r/\A(?<l>\w+) OR (?<r>\w+) -> (?<gate>\w+)\z/, operation)) && (l = map[matches["l"]]) && (r = map[matches["r"]]) do
      wire_map(map, matches["gate"], l ||| r)
    end
  end

  defp wire_lshift(map, operation) do
    if (matches = Regex.named_captures(~r/\A(?<l>\w+) LSHIFT (?<r>\d+) -> (?<gate>\w+)\z/, operation)) && (l = map[matches["l"]]) do
      r = String.to_integer(matches["r"])
      wire_map(map, matches["gate"], l <<< r)
    end
  end

  defp wire_rshift(map, operation) do
    if (matches = Regex.named_captures(~r/\A(?<l>\w+) RSHIFT (?<r>\d+) -> (?<gate>\w+)\z/, operation)) && (l = map[matches["l"]]) do
      r = String.to_integer(matches["r"])
      wire_map(map, matches["gate"], l >>> r)
    end
  end

  defp wire_not(map, operation) do
    if (matches = Regex.named_captures(~r/\ANOT (?<l>\w+) -> (?<gate>\w+)\z/, operation)) && (l = map[matches["l"]]) do
      wire_map(map, matches["gate"], 65535 - l)
    end
  end

  defp wire_map(map, gate, value) do
    Map.merge(map, %{gate => value})
  end
end
