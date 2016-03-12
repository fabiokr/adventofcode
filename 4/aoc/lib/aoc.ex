defmodule Aoc do
  def input(path) do
    File.read!(path)
    |> mine
  end

  def mine(secret) do
    String.rstrip(secret, ?\n)
    |> do_mine(1)
  end

  def do_mine(secret, i) do
    if Regex.match?(~r/\A00000.+\z/, md5("#{secret}#{i}")) do
      i
    else
      do_mine(secret, i + 1)
    end
  end

  defp md5(string) do
    Base.encode16(:erlang.md5(string), case: :lower)
  end
end
