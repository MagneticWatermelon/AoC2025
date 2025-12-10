defmodule AoC.Day07Test do
  use ExUnit.Case

  @example_input """
  .......S.......
  ...............
  .......^.......
  ...............
  ......^.^......
  ...............
  .....^.^.^.....
  ...............
  ....^.^...^....
  ...............
  ...^.^...^.^...
  ...............
  ..^...^.....^..
  ...............
  .^.^.^.^.^...^.
  ...............
  """

  describe "part1/1" do
    test "solves example" do
      assert AoC.Day07.part1(@example_input) == 21
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day07.txt")
      result = AoC.Day07.part1(input)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      assert AoC.Day07.part2(@example_input) == 40
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day07.txt")
      result = AoC.Day07.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end
