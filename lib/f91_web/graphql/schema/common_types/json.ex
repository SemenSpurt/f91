defmodule F91Web.GraphQL.Schema.JSON do
  use Absinthe.Schema.Notation

  scalar :json, name: "JSON" do
    description "JSON scalar"

    serialize &serialize_json/1

    parse &parse_json/1
  end

  defp serialize_json(nil), do: nil

  defp serialize_json(value), do: Poison.encode!(value)

  defp parse_json(%{value: value}) do
    case Poison.decode(value) do
      {:ok, decoded} -> {:ok, decoded}
      {:error, _} -> :error
    end
  end

  defp parse_json(_val), do: {:ok, nil}
end
