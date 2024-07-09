defmodule ToyApp.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias ToyApp.Repo

  alias ToyApp.Posts.Microposts

  @doc """
  Returns the list of microposts.

  ## Examples

      iex> list_microposts()
      [%Microposts{}, ...]

  """
  def list_microposts do
    Repo.all(Microposts)
  end

  @doc """
  Gets a single microposts.

  Raises `Ecto.NoResultsError` if the Microposts does not exist.

  ## Examples

      iex> get_microposts!(123)
      %Microposts{}

      iex> get_microposts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_microposts!(id), do: Repo.get!(Microposts, id)

  @doc """
  Creates a microposts.

  ## Examples

      iex> create_microposts(%{field: value})
      {:ok, %Microposts{}}

      iex> create_microposts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_microposts(attrs \\ %{}) do
    %Microposts{}
    |> Microposts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a microposts.

  ## Examples

      iex> update_microposts(microposts, %{field: new_value})
      {:ok, %Microposts{}}

      iex> update_microposts(microposts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_microposts(%Microposts{} = microposts, attrs) do
    microposts
    |> Microposts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a microposts.

  ## Examples

      iex> delete_microposts(microposts)
      {:ok, %Microposts{}}

      iex> delete_microposts(microposts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_microposts(%Microposts{} = microposts) do
    Repo.delete(microposts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking microposts changes.

  ## Examples

      iex> change_microposts(microposts)
      %Ecto.Changeset{data: %Microposts{}}

  """
  def change_microposts(%Microposts{} = microposts, attrs \\ %{}) do
    Microposts.changeset(microposts, attrs)
  end
end
