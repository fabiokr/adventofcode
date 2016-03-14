defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  @square_false [
    [false, false, false],
    [false, false, false],
    [false, false, false]
  ]

  @square_true [
    [true, true, true],
    [true, true, true],
    [true, true, true]
  ]

  test "process turn on" do
    assert Aoc.process(@square_false, ["turn on 0,0 through 1,1"]) == [
      [true, true, false],
      [true, true, false],
      [false, false, false]
    ]

    assert Aoc.process(@square_false, ["turn on 1,1 through 2,1"]) == [
      [false, false, false],
      [false, true, false],
      [false, true, false]
    ]

    assert Aoc.process(@square_false, ["turn on 0,0 through 2,2"]) == @square_true
  end

  test "process turn off" do
    assert Aoc.process(@square_true, ["turn off 0,0 through 1,1"]) == [
      [false, false, true],
      [false, false, true],
      [true, true, true]
    ]

    assert Aoc.process(@square_true, ["turn off 1,1 through 2,1"]) == [
      [true, true, true],
      [true, false, true],
      [true, false, true]
    ]

    assert Aoc.process(@square_true, ["turn off 0,0 through 2,2"]) == @square_false
  end

  test "process toggle" do
    assert Aoc.process(@square_true, ["toggle 0,0 through 2,2"]) == @square_false
    assert Aoc.process(@square_false, ["toggle 0,0 through 2,2"]) == @square_true
  end

  test "count" do
    assert Aoc.count(@square_false) == 0
    assert Aoc.count(@square_true) == 9
  end
end
