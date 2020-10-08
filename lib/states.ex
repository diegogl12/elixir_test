defmodule States do
  alias States.Client
  alias States.Csv
  alias States.CityStateHandler

  def execute_from_client(quantity \\ 3) do
    case Client.get_states_and_cities() do
      {:ok, response} -> result(response, quantity)
      {_, reason} -> {:error, reason}
    end
  end

  def execute_from_csv(quantity \\ 3) do
    case Csv.get_states_and_cities() do
      {:ok, response} -> result(response, quantity)
      {_, reason} -> {:error, reason}
    end
  end

  defp result(cities_info, quantity) do
    cities_info
    |> handle_info
    |> get_first_registries(quantity)
  end

  defp handle_info(states_info) do
    states_info
    |> CityStateHandler.slice_by_info()
    |> CityStateHandler.list_by_state()
    |> CityStateHandler.sort_by_cities_quantity()
  end

  defp get_first_registries(_, 0), do: []

  defp get_first_registries([state | states], quantity) do
    [state | get_first_registries(states, quantity - 1)]
  end
end
