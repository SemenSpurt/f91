defmodule F91Web.GraphQL.Schema.Time do
  use Absinthe.Schema.Notation

  scalar :time, name: "time" do
    description("time without date")

    serialize(&serialize_time/1)

    parse(&parse_time/1)
  end

  defp serialize_time(value) when is_integer(value) do
    hh = trunc(value / 3600)
    mm = trunc((value - hh * 3600) / 60)
    # ss = value - (hh * 3600) - (mm * 60)
    "#{lz(hh)}:#{lz(mm)}}"
  end

  defp serialize_time(%Time{} = value) do
    # "%H:%M:%S"
    "#{lz(value.hour)}:#{lz(value.minute)}"
  end






  defp parse_time(value) do
    if %{value: val} = value do
      parse_timestamp(val)
    else
      parse_timestamp(value)
    end
  end

  defp parse_timestamp(%Time{} = value) do
    {:ok, value}
  end

  defp parse_timestamp(value) when is_binary(value) do
    "#{value}:00"
    |> Time.from_iso8601()
  end

  defp parse_timestamp(value) when is_integer(value) do
    value
    |> Time.from_seconds_after_midnight(value)
  end

  # ADD LEADING ZEROES
  defp lz(val) when is_integer(val) do
    "00#{val}"
    |> String.slice(-2..-1)
  end
end
