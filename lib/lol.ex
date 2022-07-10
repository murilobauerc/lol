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
    @doc """
        iex> Lol.get_champion_rotations()
        iex> [freeChampionIds: [13, 23, 29, 41, 50, 54, 58, 83, 84, 102, 103, 107, 110, 234,235, 412],
        ...>  freeChampionIdsForNewPlayers: [222, 254, 427, 82, 131, 147, 54, 17, 18, 37],
        ...>  maxNewPlayerLevel: 10]
    """
    def get_champion_rotations() do
      case get("/lol/platform/v3/champion-rotations") do
        {:ok, %Tesla.Env{body: body}} -> atomize_keys(body)
      end
    end

    def get_summoner_by(name) do
      "/lol/summoner/v4/summoners/by-name/#{name}"
      |> URI.encode()
      |> get()
      |> case do
          {:ok, %Tesla.Env{body: body}} -> atomize_keys(body)
      end
    end
end
