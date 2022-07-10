defmodule Lol do
  @moduledoc """
  LOL API Wrapper.
  """
  use Tesla

  import Utils.Helper, only: [atomize_keys: 1]

  plug Tesla.Middleware.BaseUrl, "https://br1.api.riotgames.com"
  plug Tesla.Middleware.Headers,
    [{
      "X-Riot-Token",
      Application.get_env(:lol, :lol_api_key)
    }]
    plug Tesla.Middleware.JSON

    ## Examples

        #iex> %{"freeChampionsIds" => [13, 23,]}

    def get_champion_rotations() do
      case get("/lol/platform/v3/champion-rotations") do
        {:ok, %Tesla.Env{body: body}} -> atomize_keys(body)
      end
    end
end
