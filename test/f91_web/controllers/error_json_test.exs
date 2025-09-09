defmodule F91Web.ErrorJSONTest do
  use F91Web.ConnCase, async: true

  test "renders 404" do
    assert F91Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert F91Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
