defmodule States.Client do
  use HTTPoison.Base
  @default_url "https://gist.githubusercontent.com/chronossc/1a010c6968528066acbee6bc03c2aefa/raw/bfbd1f86ed026c935e6b4df365caf0cd054ce947/cities.csv"

  def get_states_and_cities(url \\ @default_url) do
    case get(url) do
        {:ok, %HTTPoison.Response{body: body, status_code: 200}} -> {:ok, body}
        {:ok, %HTTPoison.Response{status_code: status}} -> {:error, status}
    end
  end
end
