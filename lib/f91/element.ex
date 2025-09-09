defmodule F91.Element do
  @moduledoc """
  The Element context.
  """

  import Ecto.Query, warn: false
  alias F91.Repo

  alias F91.Element.CommonFields

  @doc """
  Returns the list of common_fields.

  ## Examples

      iex> list_common_fields()
      [%CommonFields{}, ...]

  """
  def list_common_fields do
    Repo.all(CommonFields)
  end

  @doc """
  Gets a single common_fields.

  Raises `Ecto.NoResultsError` if the Common fields does not exist.

  ## Examples

      iex> get_common_fields!(123)
      %CommonFields{}

      iex> get_common_fields!(456)
      ** (Ecto.NoResultsError)

  """
  def get_common_fields!(id), do: Repo.get!(CommonFields, id)

  @doc """
  Creates a common_fields.

  ## Examples

      iex> create_common_fields(%{field: value})
      {:ok, %CommonFields{}}

      iex> create_common_fields(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_common_fields(attrs) do
    %CommonFields{}
    |> CommonFields.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a common_fields.

  ## Examples

      iex> update_common_fields(common_fields, %{field: new_value})
      {:ok, %CommonFields{}}

      iex> update_common_fields(common_fields, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_common_fields(%CommonFields{} = common_fields, attrs) do
    common_fields
    |> CommonFields.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a common_fields.

  ## Examples

      iex> delete_common_fields(common_fields)
      {:ok, %CommonFields{}}

      iex> delete_common_fields(common_fields)
      {:error, %Ecto.Changeset{}}

  """
  def delete_common_fields(%CommonFields{} = common_fields) do
    Repo.delete(common_fields)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking common_fields changes.

  ## Examples

      iex> change_common_fields(common_fields)
      %Ecto.Changeset{data: %CommonFields{}}

  """
  def change_common_fields(%CommonFields{} = common_fields, attrs \\ %{}) do
    CommonFields.changeset(common_fields, attrs)
  end

  alias F91.Element.Frame

  @doc """
  Returns the list of frames.

  ## Examples

      iex> list_frames()
      [%Frame{}, ...]

  """
  def list_frames do
    Repo.all(Frame)
  end

  @doc """
  Gets a single frame.

  Raises `Ecto.NoResultsError` if the Frame does not exist.

  ## Examples

      iex> get_frame!(123)
      %Frame{}

      iex> get_frame!(456)
      ** (Ecto.NoResultsError)

  """
  def get_frame!(id), do: Repo.get!(Frame, id)

  @doc """
  Creates a frame.

  ## Examples

      iex> create_frame(%{field: value})
      {:ok, %Frame{}}

      iex> create_frame(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_frame(attrs) do
    %Frame{}
    |> Frame.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a frame.

  ## Examples

      iex> update_frame(frame, %{field: new_value})
      {:ok, %Frame{}}

      iex> update_frame(frame, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_frame(%Frame{} = frame, attrs) do
    frame
    |> Frame.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a frame.

  ## Examples

      iex> delete_frame(frame)
      {:ok, %Frame{}}

      iex> delete_frame(frame)
      {:error, %Ecto.Changeset{}}

  """
  def delete_frame(%Frame{} = frame) do
    Repo.delete(frame)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking frame changes.

  ## Examples

      iex> change_frame(frame)
      %Ecto.Changeset{data: %Frame{}}

  """
  def change_frame(%Frame{} = frame, attrs \\ %{}) do
    Frame.changeset(frame, attrs)
  end
end
