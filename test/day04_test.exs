defmodule AoC.Day04Test do
  use ExUnit.Case

  @example_input """
  ..@@.@@@@.
  @@@.@.@.@@
  @@@@@.@.@@
  @.@@@@..@.
  @@.@@@@.@@
  .@@@@@@@.@
  .@.@.@.@@@
  @.@@@.@@@@
  .@@@@@@@@.
  @.@.@@@.@.
  """

  describe "part1/1" do
    test "solves example" do
      assert AoC.Day04.part1(@example_input) == 13
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day04.txt")
      result = AoC.Day04.part1(input)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      assert AoC.Day04.part2(@example_input) == 43
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day04.txt")
      result = AoC.Day04.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end
