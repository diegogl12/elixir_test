defmodule State.Csv do
  @path "./csv_input.csv"

  def get_states_and_cities() do
    Path.expand(@path)
    |> File.stream!()
  end
end
