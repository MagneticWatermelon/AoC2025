defmodule AoC.Day02 do
  @moduledoc """
  Advent of Code 2025 - Day 2
  """

  def part1(input) do
    input
    |> parse()
    |> Enum.reduce(0, fn {first, last}, acc ->
      for i <- first..last do
        id = Integer.to_string(i)
        mid = div(String.length(id), 2)
        {first_halve, second_halve} = String.split_at(id, mid)

        if first_halve == second_halve, do: i, else: 0
      end
      |> Enum.sum()
      |> Kernel.+(acc)
    end)
  end

  def part2(input) do
    input
    |> parse()
    |> Enum.reduce(0, fn {first, last}, acc ->
      for i <- first..last do
        id = Integer.to_string(i)
        divisors = get_divisors(String.length(id))

        has_match =
          Enum.any?(divisors, fn divisor ->
            pattern_length = div(String.length(id), divisor)
            pattern = String.slice(id, 0, pattern_length)
            String.duplicate(pattern, divisor) == id
          end)

        if has_match, do: i, else: 0
      end
      |> Enum.sum()
      |> Kernel.+(acc)
    end)
  end

  defp parse(input) do
    input
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&parse_range/1)
  end

  defp parse_range(range) do
    String.split(range, "-", parts: 2)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  defp get_divisors(id) do
    for i <- 1..id,
        rem(id, i) == 0,
        i > 1,
        do: i
  end
end
