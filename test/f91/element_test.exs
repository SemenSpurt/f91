defmodule F91.ElementTest do
  use F91.DataCase

  alias F91.Element

  describe "common_fields" do
    alias F91.Ecto.Element.CommonFields

    import F91.ElementFixtures

    @invalid_attrs %{name: nil, loc: nil, rotation: nil, order: nil, transparency: nil, dims: nil, width_type: nil, height_type: nil}

    test "list_common_fields/0 returns all common_fields" do
      common_fields = common_fields_fixture()
      assert Element.list_common_fields() == [common_fields]
    end

    test "get_common_fields!/1 returns the common_fields with given id" do
      common_fields = common_fields_fixture()
      assert Element.get_common_fields!(common_fields.id) == common_fields
    end

    test "create_common_fields/1 with valid data creates a common_fields" do
      valid_attrs = %{name: "some name", loc: [], rotation: 42, order: 42, transparency: 120.5, dims: [], width_type: :fill, height_type: :fill}

      assert {:ok, %CommonFields{} = common_fields} = Element.create_common_fields(valid_attrs)
      assert common_fields.name == "some name"
      assert common_fields.loc == []
      assert common_fields.rotation == 42
      assert common_fields.order == 42
      assert common_fields.transparency == 120.5
      assert common_fields.dims == []
      assert common_fields.width_type == :fill
      assert common_fields.height_type == :fill
    end

    test "create_common_fields/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Element.create_common_fields(@invalid_attrs)
    end

    test "update_common_fields/2 with valid data updates the common_fields" do
      common_fields = common_fields_fixture()
      update_attrs = %{name: "some updated name", loc: [], rotation: 43, order: 43, transparency: 456.7, dims: [], width_type: :hug, height_type: :hug}

      assert {:ok, %CommonFields{} = common_fields} = Element.update_common_fields(common_fields, update_attrs)
      assert common_fields.name == "some updated name"
      assert common_fields.loc == []
      assert common_fields.rotation == 43
      assert common_fields.order == 43
      assert common_fields.transparency == 456.7
      assert common_fields.dims == []
      assert common_fields.width_type == :hug
      assert common_fields.height_type == :hug
    end

    test "update_common_fields/2 with invalid data returns error changeset" do
      common_fields = common_fields_fixture()
      assert {:error, %Ecto.Changeset{}} = Element.update_common_fields(common_fields, @invalid_attrs)
      assert common_fields == Element.get_common_fields!(common_fields.id)
    end

    test "delete_common_fields/1 deletes the common_fields" do
      common_fields = common_fields_fixture()
      assert {:ok, %CommonFields{}} = Element.delete_common_fields(common_fields)
      assert_raise Ecto.NoResultsError, fn -> Element.get_common_fields!(common_fields.id) end
    end

    test "change_common_fields/1 returns a common_fields changeset" do
      common_fields = common_fields_fixture()
      assert %Ecto.Changeset{} = Element.change_common_fields(common_fields)
    end
  end

  describe "frames" do
    alias F91.Ecto.Element.Frame

    import F91.ElementFixtures

    @invalid_attrs %{layout_type: nil, h_align: nil, v_align: nil, top_pad: nil, bottom_pad: nil, right_pad: nil, left_pad: nil, gap: nil, clip_content: nil}

    test "list_frames/0 returns all frames" do
      frame = frame_fixture()
      assert Element.list_frames() == [frame]
    end

    test "get_frame!/1 returns the frame with given id" do
      frame = frame_fixture()
      assert Element.get_frame!(frame.id) == frame
    end

    test "create_frame/1 with valid data creates a frame" do
      valid_attrs = %{layout_type: :absolute, h_align: :left, v_align: :top, top_pad: 120.5, bottom_pad: 120.5, right_pad: 120.5, left_pad: 120.5, gap: 120.5, clip_content: true}

      assert {:ok, %Frame{} = frame} = Element.create_frame(valid_attrs)
      assert frame.layout_type == :absolute
      assert frame.h_align == :left
      assert frame.v_align == :top
      assert frame.top_pad == 120.5
      assert frame.bottom_pad == 120.5
      assert frame.right_pad == 120.5
      assert frame.left_pad == 120.5
      assert frame.gap == 120.5
      assert frame.clip_content == true
    end

    test "create_frame/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Element.create_frame(@invalid_attrs)
    end

    test "update_frame/2 with valid data updates the frame" do
      frame = frame_fixture()
      update_attrs = %{layout_type: :column, h_align: :center, v_align: :center, top_pad: 456.7, bottom_pad: 456.7, right_pad: 456.7, left_pad: 456.7, gap: 456.7, clip_content: false}

      assert {:ok, %Frame{} = frame} = Element.update_frame(frame, update_attrs)
      assert frame.layout_type == :column
      assert frame.h_align == :center
      assert frame.v_align == :center
      assert frame.top_pad == 456.7
      assert frame.bottom_pad == 456.7
      assert frame.right_pad == 456.7
      assert frame.left_pad == 456.7
      assert frame.gap == 456.7
      assert frame.clip_content == false
    end

    test "update_frame/2 with invalid data returns error changeset" do
      frame = frame_fixture()
      assert {:error, %Ecto.Changeset{}} = Element.update_frame(frame, @invalid_attrs)
      assert frame == Element.get_frame!(frame.id)
    end

    test "delete_frame/1 deletes the frame" do
      frame = frame_fixture()
      assert {:ok, %Frame{}} = Element.delete_frame(frame)
      assert_raise Ecto.NoResultsError, fn -> Element.get_frame!(frame.id) end
    end

    test "change_frame/1 returns a frame changeset" do
      frame = frame_fixture()
      assert %Ecto.Changeset{} = Element.change_frame(frame)
    end
  end
end
