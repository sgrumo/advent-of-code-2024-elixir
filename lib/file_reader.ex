defmodule FileReader do
  def parse_input(file_path) do
    case File.read(file_path) do
      {:error, error} -> raise "Failed to read file, reason: #{error}"
      {:ok, content} -> {:ok, content}
    end
  end
end
