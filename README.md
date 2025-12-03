# Advent of Code 2025

My solutions for [Advent of Code 2025](https://adventofcode.com/2025), written in Elixir.

## Project Structure

- `lib/` - Solution modules (e.g., `AoC.Day01`).
- `test/` - Tests for solutions.
- `priv/inputs/` - Puzzle inputs.

## Running Solutions

This project uses standard Mix commands.

### Run Tests

Run all tests:
```bash
mix test
```

Run tests for a specific day:
```bash
mix test test/day01_test.exs
```

### Run Code

Start an interactive shell with the project loaded:
```bash
iex -S mix
```

Then you can run functions directly (assuming input file exists):
```elixir
input = File.read!("priv/inputs/day01.txt")
AoC.Day01.part1(input)
```

## Adding a New Day

1. Create a solution file: `lib/dayXX.ex`
   ```elixir
   defmodule AoC.DayXX do
     def part1(input) do
       # ...
     end

     def part2(input) do
       # ...
     end
   end
   ```
2. Create a test file: `test/dayXX_test.exs`
3. Add input: `priv/inputs/dayXX.txt`
