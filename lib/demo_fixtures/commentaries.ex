defmodule DemoFixtures.Commentaries do
  @moduledoc """
  The Commentaries context.
  """

  import Ecto.Query, warn: false
  alias DemoFixtures.Repo

  alias DemoFixtures.Commentaries.Commentary

  @doc """
  Returns the list of commentaries.

  ## Examples

      iex> list_commentaries()
      [%Commentary{}, ...]

  """
  def list_commentaries do
    Repo.all(Commentary)
  end

  @doc """
  Gets a single commentary.

  Raises `Ecto.NoResultsError` if the Commentary does not exist.

  ## Examples

      iex> get_commentary!(123)
      %Commentary{}

      iex> get_commentary!(456)
      ** (Ecto.NoResultsError)

  """
  def get_commentary!(id), do: Repo.get!(Commentary, id)

  @doc """
  Creates a commentary.

  ## Examples

      iex> create_commentary(%{field: value})
      {:ok, %Commentary{}}

      iex> create_commentary(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_commentary(attrs \\ %{}) do
    %Commentary{}
    |> Commentary.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a commentary.

  ## Examples

      iex> update_commentary(commentary, %{field: new_value})
      {:ok, %Commentary{}}

      iex> update_commentary(commentary, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_commentary(%Commentary{} = commentary, attrs) do
    commentary
    |> Commentary.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Commentary.

  ## Examples

      iex> delete_commentary(commentary)
      {:ok, %Commentary{}}

      iex> delete_commentary(commentary)
      {:error, %Ecto.Changeset{}}

  """
  def delete_commentary(%Commentary{} = commentary) do
    Repo.delete(commentary)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking commentary changes.

  ## Examples

      iex> change_commentary(commentary)
      %Ecto.Changeset{source: %Commentary{}}

  """
  def change_commentary(%Commentary{} = commentary) do
    Commentary.changeset(commentary, %{})
  end
end
