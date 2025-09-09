defmodule F91Web.GraphQL.Middlewares.HandleErrors do
  import F91Web.Gettext

  @behaviour Absinthe.Middleware

  def call(resolution, _) do
    %{resolution | errors: Enum.flat_map(resolution.errors, &handle_error/1)}
  end

  defp handle_error(%Postgrex.Error{} = error) do
    [
      %{
        code: 500,
        message: Gettext.dgettext("errors", "postgrex error"),
        errors: [Map.from_struct(error)]
      }
    ]
  end

  defp handle_error(%Ecto.Changeset{} = changeset) do
    errors =
      changeset
      |> Ecto.Changeset.traverse_errors(fn
        {msg, opts} ->
          Regex.replace(~r/%{(count|number)}/, msg, fn _, match ->
            to_string(opts[String.to_atom(match)])
          end)

        msg ->
          msg
      end)

    [%{code: 422, message: Gettext.dgettext("errors", "validation error"), errors: errors}]
  end

  defp handle_error(:not_found) do
    [%{code: 404, message: Gettext.dgettext("errors", "not found")}]
  end

  defp handle_error(val) do
    if !is_list(val) do
      [val]
    else
      val
    end
  end
end
