defmodule ToyAppWeb.MicropostsController do
  use ToyAppWeb, :controller

  alias ToyApp.Posts
  alias ToyApp.Posts.Microposts

  def index(conn, _params) do
    microposts = Posts.list_microposts()
    render(conn, :index, microposts_collection: microposts)
  end

  def new(conn, _params) do
    changeset = Posts.change_microposts(%Microposts{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"microposts" => microposts_params}) do
    case Posts.create_microposts(microposts_params) do
      {:ok, microposts} ->
        conn
        |> put_flash(:info, "Microposts created successfully.")
        |> redirect(to: ~p"/microposts/#{microposts}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    microposts = Posts.get_microposts!(id)
    render(conn, :show, microposts: microposts)
  end

  def edit(conn, %{"id" => id}) do
    microposts = Posts.get_microposts!(id)
    changeset = Posts.change_microposts(microposts)
    render(conn, :edit, microposts: microposts, changeset: changeset)
  end

  def update(conn, %{"id" => id, "microposts" => microposts_params}) do
    microposts = Posts.get_microposts!(id)

    case Posts.update_microposts(microposts, microposts_params) do
      {:ok, microposts} ->
        conn
        |> put_flash(:info, "Microposts updated successfully.")
        |> redirect(to: ~p"/microposts/#{microposts}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, microposts: microposts, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    microposts = Posts.get_microposts!(id)
    {:ok, _microposts} = Posts.delete_microposts(microposts)

    conn
    |> put_flash(:info, "Microposts deleted successfully.")
    |> redirect(to: ~p"/microposts")
  end
end
