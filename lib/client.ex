defmodule States.Client do
  use HTTPoison.Base

  def get_states_and_cities() do
    case get("https://gist.githubusercontent.com/chronossc/1a010c6968528066acbee6bc03c2aefa/raw/bfbd1f86ed026c935e6b4df365caf0cd054ce947/cities.csv") do
        {:ok, %HTTPoison.Response{body: body, status_code: 200}} -> {:ok, body}
        {:ok, %HTTPoison.Response{status_code: status}} -> {:error, status}
    end
  end
end
