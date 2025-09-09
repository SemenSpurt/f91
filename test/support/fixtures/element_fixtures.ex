defmodule F91.ElementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `F91.Element` context.
  """

  @doc """
  Generate a common_fields.
  """
  def common_fields_fixture(attrs \\ %{}) do
    {:ok, common_fields} =
      attrs
      |> Enum.into(%{
        dims: [],
        height_type: :fill,
        loc: [],
        name: "some name",
        order: 42,
        rotation: 42,
        transparency: 120.5,
        width_type: :fill
      })
      |> F91.Element.create_common_fields()

    common_fields
  end

  @doc """
  Generate a frame.
  """
  def frame_fixture(attrs \\ %{}) do
    {:ok, frame} =
      attrs
      |> Enum.into(%{
        bottom_pad: 120.5,
        clip_content: true,
        gap: 120.5,
        h_align: :left,
        layout_type: :absolute,
        left_pad: 120.5,
        right_pad: 120.5,
        top_pad: 120.5,
        v_align: :top
      })
      |> F91.Element.create_frame()

    frame
  end
end
