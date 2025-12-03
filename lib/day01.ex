defmodule AoC.Day01 do
  @moduledoc """
  Advent of Code 2025 - Day 1
  """

  def part1(input) do
    input
    |> parse()
    |> Enum.reduce({50, 0}, fn {direction, amount}, {position, count} ->
      new_position = move(position, direction, amount)

      last_position = Integer.mod(new_position, 100)

      new_count = if last_position == 0, do: count + 1, else: count
      {last_position, new_count}
    end)
    |> elem(1)
  end

  @spec part2(binary()) :: list()
  def part2(input) do
    input
    |> parse()
    |> Enum.reduce({50, 0}, fn {direction, amount}, {position, count} ->
      new_position = move(position, direction, amount)

      last_position = Integer.mod(new_position, 100)

      new_count = count + count_zeros(direction, position, amount)
      {last_position, new_count}
    end)
    |> elem(1)
  end

  defp parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse_instruction/1)
  end

  defp parse_instruction(inst) do
    direction = String.first(inst)
    distance = String.slice(inst, 1..-1//1) |> String.to_integer()

    case direction do
      "L" -> {:left, distance}
      "R" -> {:right, distance}
    end
  end

  defp move(position, :left, amount) do
    Integer.mod(position - amount, 100)
  end

  defp move(position, :right, amount) do
    Integer.mod(position + amount, 100)
  end

  defp count_zeros(direction, position, amount) do
    first_zero_step =
      case direction do
        :left -> if position == 0, do: 100, else: position
        :right -> 100 - position
      end

    if first_zero_step > amount, do: 0, else: div(amount - first_zero_step, 100) + 1
  end
end
