defmodule ToyApp.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ToyApp.Posts` context.
  """

  @doc """
  Generate a microposts.
  """
  def microposts_fixture(attrs \\ %{}) do
    {:ok, microposts} =
      attrs
      |> Enum.into(%{
        content: "some content",
        user_id: 42
      })
      |> ToyApp.Posts.create_microposts()

    microposts
  end
end
