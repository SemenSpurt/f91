defmodule F91Web.CORS do
  use Corsica.Router,
    origins: [
      ~r{^http?://(.*.?)localhost(\:\d+)?$},
      ~r{^https?://(.*.?)localhost(\:\d+)?$},
      ~r{^https?://(.*.?)127.0.0.1(\:\d+)?$},
      ~r{^https?://(.*.?)postwoman.io(\:\d+)?$},
      ~r{^https?://(.*.?)fpanel.91.vpn(\:\d+)?$},
      ~r{^http?://(.*.?)91.vpn},
      ~r{^https?://(.+).111111111.dev$},
      ~r{^http?://(.*.?)ninedev.ru(\:\d+)?$},
      ~r{^https?://(.*.?)ninedev.ru(\:\d+)?$},
    ],
    allow_credentials: true,
    allow_headers: :all,
    allow_methods: :all,
    max_age: 600

  resource "/*"
end
