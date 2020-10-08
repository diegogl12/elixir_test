defmodule States do
  alias States.Client
  alias States.Csv
  alias States.CityStateHandler

  def run_from_client(quantity \\ 3) do
    {:ok, response} = Client.get_states_and_cities()
    
    response
    |> handle_info()
    |> get_first_registries(quantity)
  end

  def run_from_csv(quantity \\ 3) do
    Csv.get_states_and_cities()
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
