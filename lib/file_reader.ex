defmodule FileReader do
  def parse_input(file_path) do
    case File.read(file_path) do
      {:error, error} -> raise "Failed to read file, reason: #{error}"
      {:ok, content} -> {:ok, content}
    end
  end

  def parse_input(day_number, is_test) when is_test == true,
    do: parse_input("data/day#{day_number}/example.txt")

  def parse_input(day_number, is_test) when is_test == false,
    do: parse_input("data/day#{day_number}/input.txt")
end
