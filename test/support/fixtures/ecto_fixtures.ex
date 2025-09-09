defmodule F91.EctoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `F91.Ecto` context.
  """

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    {:ok, page} =
      attrs
      |> Enum.into(%{
        bg_color: "some bg_color",
        bg_state: true,
        bg_transparency: 120.5,
        title: "some title"
      })
      |> F91.Ecto.create_page()

    page
  end

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> F91.Ecto.create_project()

    project
  end

  @doc """
  Generate a directory.
  """
  def directory_fixture(attrs \\ %{}) do
    {:ok, directory} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> F91.Ecto.create_directory()

    directory
  end
end
