defmodule AoC.Day03Test do
  use ExUnit.Case

  @example_input """
  987654321111111
  811111111111119
  234234234234278
  818181911112111
  """

  describe "part1/1" do
    test "solves example" do
      assert AoC.Day03.part1(@example_input) == 357
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day03.txt")
      result = AoC.Day03.part1(input)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      assert AoC.Day03.part2(@example_input) == 3_121_910_778_619
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day03.txt")
      result = AoC.Day03.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end
