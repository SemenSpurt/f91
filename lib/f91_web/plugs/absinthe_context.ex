defmodule F91Web.Plugs.AbsintheContext do
  def init(_params) do
  end

  def call(conn, _params) do
    conn
    # |> IO.inspect()
    |> Absinthe.Plug.put_options(
      context: %{
        conn: conn,
        # user_session: conn.assigns[:user_session],
        # current_user: conn.assigns[:current_user],
        # abilities: conn.assigns[:abilities],
        # token: conn.assigns[:token]
      }
    )
  end
end
