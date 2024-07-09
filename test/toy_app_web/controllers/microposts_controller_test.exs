defmodule ToyAppWeb.MicropostsControllerTest do
  use ToyAppWeb.ConnCase

  import ToyApp.PostsFixtures

  @create_attrs %{content: "some content", user_id: 42}
  @update_attrs %{content: "some updated content", user_id: 43}
  @invalid_attrs %{content: nil, user_id: nil}

  describe "index" do
    test "lists all microposts", %{conn: conn} do
      conn = get(conn, ~p"/microposts")
      assert html_response(conn, 200) =~ "Listing Microposts"
    end
  end

  describe "new microposts" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/microposts/new")
      assert html_response(conn, 200) =~ "New Microposts"
    end
  end

  describe "create microposts" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/microposts", microposts: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/microposts/#{id}"

      conn = get(conn, ~p"/microposts/#{id}")
      assert html_response(conn, 200) =~ "Microposts #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/microposts", microposts: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Microposts"
    end
  end

  describe "edit microposts" do
    setup [:create_microposts]

    test "renders form for editing chosen microposts", %{conn: conn, microposts: microposts} do
      conn = get(conn, ~p"/microposts/#{microposts}/edit")
      assert html_response(conn, 200) =~ "Edit Microposts"
    end
  end

  describe "update microposts" do
    setup [:create_microposts]

    test "redirects when data is valid", %{conn: conn, microposts: microposts} do
      conn = put(conn, ~p"/microposts/#{microposts}", microposts: @update_attrs)
      assert redirected_to(conn) == ~p"/microposts/#{microposts}"

      conn = get(conn, ~p"/microposts/#{microposts}")
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, microposts: microposts} do
      conn = put(conn, ~p"/microposts/#{microposts}", microposts: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Microposts"
    end
  end

  describe "delete microposts" do
    setup [:create_microposts]

    test "deletes chosen microposts", %{conn: conn, microposts: microposts} do
      conn = delete(conn, ~p"/microposts/#{microposts}")
      assert redirected_to(conn) == ~p"/microposts"

      assert_error_sent 404, fn ->
        get(conn, ~p"/microposts/#{microposts}")
      end
    end
  end

  defp create_microposts(_) do
    microposts = microposts_fixture()
    %{microposts: microposts}
  end
end
