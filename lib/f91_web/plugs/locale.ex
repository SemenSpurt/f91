defmodule F91Web.Plugs.Locale do
  import Plug.Conn

  defmodule Config do
    defstruct gettext: nil
  end

  def init(gettext: gettext) do
    %Config{gettext: gettext}
  end

  def call(conn, config) do
    locale =
      conn
      |> extract_accept_language()
      |> Enum.find(nil, fn accepted_locale -> supported_locale?(accepted_locale, config) end)

    if supported_locale?(locale, config) do
      Gettext.put_locale(config.gettext, locale)
    else
      Gettext.put_locale(config.gettext, "ru")
    end

    conn
    |> assign(:locale, Gettext.get_locale(config.gettext))
  end

  def extract_accept_language(conn) do
    case Plug.Conn.get_req_header(conn, "accept-language") do
      [value | _] ->
        value
        |> String.split(",")
        |> Enum.map(&parse_language_option/1)
        |> Enum.sort(&(&1.quality > &2.quality))
        |> Enum.map(& &1.tag)
        |> Enum.reject(&is_nil/1)
        |> ensure_language_fallbacks()

      _ ->
        []
    end
  end

  defp parse_language_option(string) do
    captures = Regex.named_captures(~r/^\s?(?<tag>[\w\-]+)(?:;q=(?<quality>[\d\.]+))?$/i, string)

    quality =
      case Float.parse(captures["quality"] || "1.0") do
        {val, _} -> val
        _ -> 1.0
      end

    %{tag: captures["tag"], quality: quality}
  end

  defp ensure_language_fallbacks(tags) do
    Enum.flat_map(tags, fn tag ->
      [language | _] = String.split(tag, "-")
      if Enum.member?(tags, language), do: [tag], else: [tag, language]
    end)
  end

  defp supported_locales(config), do: Gettext.known_locales(config.gettext)
  defp supported_locale?(locale, config), do: Enum.member?(supported_locales(config), locale)
end
