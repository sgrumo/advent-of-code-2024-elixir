defmodule SolutionDay3 do
  def solve() do
    {:ok, content} = FileReader.parse_input(3, false)

    mul_regex = ~r/mul\(\d*\,\d*\)/
    digit_regex = ~r/(\d)*/

    Regex.scan(mul_regex, content)
    |> Enum.map(&hd/1)
    |> Enum.map(fn mul ->
      Regex.scan(digit_regex, mul)
      |> Enum.map(&hd/1)
      |> Enum.filter(fn el -> el != "" end)
      |> Enum.map(fn el -> String.to_integer(el) end)
      |> Enum.reduce(fn el, acc -> acc * el end)
    end)
    |> Enum.sum()
    |> IO.puts()
  end
end
