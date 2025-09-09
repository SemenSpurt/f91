defmodule F91Web.GraphQL.Schema.Date do
  use Absinthe.Schema.Notation

  scalar :date, name: "Date" do
    description("Date in ISO 8601 format(YYYY-MM-DD)")

    serialize(&serialize_date/1)

    parse(&parse_date/1)
  end

  defp serialize_date(%NaiveDateTime{} = value), do: Date.to_iso8601(value)
  defp serialize_date(%DateTime{} = value), do: Date.to_iso8601(value)
  defp serialize_date(%Date{} = value), do: Date.to_iso8601(value)

  defp serialize_date(_), do: nil

  defp parse_date(%{value: value}) when is_binary(value), do: Date.from_iso8601(value)

  defp parse_date(_), do: :error
end
