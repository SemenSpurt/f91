defmodule F91Web.GraphQL.Schema.UUID do
  use Absinthe.Schema.Notation

  scalar :uuid, name: "UUID" do
    description "UUID scalar"

    serialize &serialize_uuid/1

    parse &parse_uuid/1
  end

  defp serialize_uuid(nil), do: nil

  defp serialize_uuid(value), do: value

  defp parse_uuid(%{value: value}) do
    case UUID.info(value) do
      {:ok, _} -> {:ok, value}
      {:error, _} -> :error
    end
  end

  defp parse_uuid(_val), do: {:ok, nil}
end
