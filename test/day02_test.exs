defmodule AoC.Day02Test do
  use ExUnit.Case

  @example_input """
  """

  describe "part1/1" do
    test "solves example" do
      # assert AoC.Day02.part1(@example_input) == :todo
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day02.txt")
      result = AoC.Day02.part1(input)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      # assert AoC.Day02.part2(@example_input) == :todo
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day02.txt")
      result = AoC.Day02.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end
