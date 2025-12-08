defmodule AoC.Day06 do
  @moduledoc """
  Advent of Code 2025 - Day 6
  """

  def part1(input) do
    input
    |> parse()
    |> Enum.map(&calculate_value/1)
    |> Enum.sum()
  end

  def part2(input) do
    lines = input |> String.split("\n", trim: true)
    {operator_line, number_lines} = List.pop_at(lines, -1)

    operators =
      operator_line
      |> String.graphemes()
      |> Enum.with_index()
      |> Enum.filter(fn {char, _} -> char in ["*", "+"] end)

    max_len =
      lines
      |> Enum.map(&String.length/1)
      |> Enum.max()

    operators
    |> Enum.map(fn {_, idx} -> idx end)
    |> Enum.chunk_every(2, 1, [max_len])
    |> Enum.zip(operators)
    |> Enum.map(fn {[start, stop], {op, _}} -> {op, start..(stop - 1)} end)
    |> Enum.map(fn {op, range} ->
      numbers =
        range
        |> Enum.map(fn col_idx ->
          digits =
            number_lines
            |> Enum.map(fn line ->
              if col_idx < String.length(line) do
                String.at(line, col_idx)
              else
                " "
              end
            end)
            |> Enum.filter(fn char -> char != " " end)

          if digits == [] do
            nil
          else
            digits |> Enum.join() |> String.to_integer()
          end
        end)
        |> Enum.reject(&is_nil/1)

      case op do
        "*" -> Enum.reduce(numbers, 1, &*/2)
        "+" -> Enum.reduce(numbers, 0, &+/2)
      end
    end)
    |> Enum.sum()
  end

  defp parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(&Enum.with_index(&1, fn value, index -> {index, value} end))
    |> List.flatten()
    |> Enum.reduce(%{}, fn {index, value}, acc ->
      Map.update(acc, index, [value], fn column -> [value | column] end)
    end)
    |> Map.values()
  end

  defp calculate_value([op | values]) do
    values = values |> Enum.map(&String.to_integer/1)

    case op do
      "*" -> Enum.reduce(values, 1, &*/2)
      "+" -> Enum.reduce(values, 0, &+/2)
    end
  end
end
