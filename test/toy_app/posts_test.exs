defmodule ToyApp.PostsTest do
  use ToyApp.DataCase

  alias ToyApp.Posts

  describe "microposts" do
    alias ToyApp.Posts.Microposts

    import ToyApp.PostsFixtures

    @invalid_attrs %{content: nil, user_id: nil}

    test "list_microposts/0 returns all microposts" do
      microposts = microposts_fixture()
      assert Posts.list_microposts() == [microposts]
    end

    test "get_microposts!/1 returns the microposts with given id" do
      microposts = microposts_fixture()
      assert Posts.get_microposts!(microposts.id) == microposts
    end

    test "create_microposts/1 with valid data creates a microposts" do
      valid_attrs = %{content: "some content", user_id: 42}

      assert {:ok, %Microposts{} = microposts} = Posts.create_microposts(valid_attrs)
      assert microposts.content == "some content"
      assert microposts.user_id == 42
    end

    test "create_microposts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_microposts(@invalid_attrs)
    end

    test "update_microposts/2 with valid data updates the microposts" do
      microposts = microposts_fixture()
      update_attrs = %{content: "some updated content", user_id: 43}

      assert {:ok, %Microposts{} = microposts} = Posts.update_microposts(microposts, update_attrs)
      assert microposts.content == "some updated content"
      assert microposts.user_id == 43
    end

    test "update_microposts/2 with invalid data returns error changeset" do
      microposts = microposts_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_microposts(microposts, @invalid_attrs)
      assert microposts == Posts.get_microposts!(microposts.id)
    end

    test "delete_microposts/1 deletes the microposts" do
      microposts = microposts_fixture()
      assert {:ok, %Microposts{}} = Posts.delete_microposts(microposts)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_microposts!(microposts.id) end
    end

    test "change_microposts/1 returns a microposts changeset" do
      microposts = microposts_fixture()
      assert %Ecto.Changeset{} = Posts.change_microposts(microposts)
    end
  end
end
