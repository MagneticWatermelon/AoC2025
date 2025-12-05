defmodule AoC.Day03 do
  @moduledoc """
  Advent of Code 2025 - Day 3
  """

  def part1(input) do
    input
    |> parse(2)
  end

  def part2(input) do
    input
    |> parse(12)
  end

  defp parse(input, num_digits) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&process_row(&1, num_digits))
    |> Enum.map(&calculate_bank_value/1)
    |> Enum.sum()
  end

  defp process_row(line, num_digits) do
    digits =
      line
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)

    find_largest_subsequence(digits, num_digits)
  end

  defp find_largest_subsequence(input_list, target_length) do
    total_items = length(input_list)

    process(input_list, [], target_length, total_items)
    |> Enum.reverse()
  end

  defp process([], stack, _target, _remaining), do: stack

  defp process([current_digit | rest_input], stack, target, remaining) do
    updated_stack = maybe_pop(stack, current_digit, target, remaining)

    final_stack =
      if length(updated_stack) < target do
        [current_digit | updated_stack]
      else
        updated_stack
      end

    process(rest_input, final_stack, target, remaining - 1)
  end

  defp maybe_pop([], _digit, _target, _rem), do: []

  defp maybe_pop([top | rest] = stack, current_digit, target, remaining) do
    if top < current_digit and length(stack) + remaining > target do
      maybe_pop(rest, current_digit, target, remaining)
    else
      stack
    end
  end

  defp calculate_bank_value(digits) when is_list(digits), do: Integer.undigits(digits)
end
