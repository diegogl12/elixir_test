defmodule States.Csv do
  @default_path "./csv_input.csv"

  def get_states_and_cities(path \\ @default_path) do
    Path.expand(path)
    |> File.read()
  end
end
