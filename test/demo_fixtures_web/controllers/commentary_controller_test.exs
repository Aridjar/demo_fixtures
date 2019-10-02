defmodule DemoFixturesWeb.CommentaryControllerTest do
  use DemoFixturesWeb.ConnCase

  alias DemoFixtures.Commentaries

  @create_attrs %{content: "some content"}
  @update_attrs %{content: "some updated content"}
  @invalid_attrs %{content: nil}

  def fixture(:commentary) do
    {:ok, commentary} = Commentaries.create_commentary(@create_attrs)
    commentary
  end

  describe "index" do
    test "lists all commentaries", %{conn: conn} do
      conn = get(conn, Routes.commentary_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Commentaries"
    end
  end

  describe "new commentary" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.commentary_path(conn, :new))
      assert html_response(conn, 200) =~ "New Commentary"
    end
  end

  describe "create commentary" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.commentary_path(conn, :create), commentary: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.commentary_path(conn, :show, id)

      conn = get(conn, Routes.commentary_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Commentary"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.commentary_path(conn, :create), commentary: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Commentary"
    end
  end

  describe "edit commentary" do
    setup [:create_commentary]

    test "renders form for editing chosen commentary", %{conn: conn, commentary: commentary} do
      conn = get(conn, Routes.commentary_path(conn, :edit, commentary))
      assert html_response(conn, 200) =~ "Edit Commentary"
    end
  end

  describe "update commentary" do
    setup [:create_commentary]

    test "redirects when data is valid", %{conn: conn, commentary: commentary} do
      conn = put(conn, Routes.commentary_path(conn, :update, commentary), commentary: @update_attrs)
      assert redirected_to(conn) == Routes.commentary_path(conn, :show, commentary)

      conn = get(conn, Routes.commentary_path(conn, :show, commentary))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, commentary: commentary} do
      conn = put(conn, Routes.commentary_path(conn, :update, commentary), commentary: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Commentary"
    end
  end

  describe "delete commentary" do
    setup [:create_commentary]

    test "deletes chosen commentary", %{conn: conn, commentary: commentary} do
      conn = delete(conn, Routes.commentary_path(conn, :delete, commentary))
      assert redirected_to(conn) == Routes.commentary_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.commentary_path(conn, :show, commentary))
      end
    end
  end

  defp create_commentary(_) do
    commentary = fixture(:commentary)
    {:ok, commentary: commentary}
  end
end
