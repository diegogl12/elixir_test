defmodule States.CityStateHandler do

  def slice_by_info(""), do: nil
  def slice_by_info(csv_input) when is_binary(csv_input) do
    cities =
      String.split(csv_input, "\n")
      |> Enum.map(fn info -> String.split(info, ",") end)

    Enum.map(cities, fn [_ | city_state] ->
      [
        String.slice(
          List.first(city_state),
          String.length(List.first(city_state)) - 4,
          String.length(List.first(city_state))
        ),
        String.slice(List.first(city_state), 0, String.length(List.first(city_state)) - 5)
      ]
    end)
  end
  def slice_by_info(_), do: nil

  def list_by_state(cities) when is_list(cities) do
    Enum.reduce(cities, %{}, fn city_state, acc ->
      [state, _] = city_state

      Map.put(acc, state, Map.get(acc, state, 0) + 1)
    end)
  end

  def list_by_state(_), do: nil

  def sort_by_cities_quantity(states) when is_map(states) do
    Enum.sort_by(states, fn {_, value} -> -value end)
  end

  def sort_by_cities_quantity(_), do: nil
end
