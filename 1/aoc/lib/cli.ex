defmodule Aoc.CLI do
  def main(argv) do
    argv
      |> parse_args
      |> process
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      { [help: true], _, _ } -> :help
      { _, name, _ }         -> name
      _                      -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: aoc <filepath>
    """

    System.halt(0)
  end

  def process(filepath) do
    IO.puts Aoc.input(filepath)
  end
end
