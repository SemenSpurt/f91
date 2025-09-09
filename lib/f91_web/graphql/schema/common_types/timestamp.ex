defmodule F91Web.GraphQL.Schema.Timestamp do
  use Absinthe.Schema.Notation

  scalar :timestamp, name: "Timestamp" do
    description("Unix timestamp")

    serialize(&serialize_time/1)

    parse(&parse_time/1)
  end

  defp serialize_time(value) when is_binary(value), do: DateTime.from_iso8601(value) |> elem(1)

  defp serialize_time(value) when is_integer(value), do: value

  defp serialize_time(%DateTime{} = value), do: DateTime.to_unix(value)

  defp serialize_time(%NaiveDateTime{} = value) do
    value
    |> DateTime.from_naive!("Etc/UTC")
    |> DateTime.to_unix()
  end

  defp parse_time(value) do
    if %{value: val} = value do
      parse_timestamp(val)
    else
      parse_timestamp(value)
    end
  end

  defp parse_timestamp(value) when is_binary(value) do
    value
    |> String.to_integer()
    |> DateTime.from_unix()
  end

  defp parse_timestamp(value) when is_integer(value) do
    value
    |> DateTime.from_unix()
  end
end
