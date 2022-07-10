defmodule Utils.Helper do
  def atomize_keys(map) do
    for {key, val} <- map, do: {String.to_atom(key), val}
  end
end
