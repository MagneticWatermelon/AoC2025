defmodule AoC.Day05Test do
  use ExUnit.Case

  @example_input """
  3-5
  10-14
  16-20
  12-18

  1
  5
  8
  11
  17
  32
  """

  describe "part1/1" do
    test "solves example" do
      assert AoC.Day05.part1(@example_input) == 3
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day05.txt")
      result = AoC.Day05.part1(input)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      assert AoC.Day05.part2(@example_input) == 14
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day05.txt")
      result = AoC.Day05.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end
