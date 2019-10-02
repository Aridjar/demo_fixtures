defmodule DemoFixturesWeb.CommentaryController do
  use DemoFixturesWeb, :controller

  alias DemoFixtures.Commentaries
  alias DemoFixtures.Commentaries.Commentary

  def index(conn, _params) do
    commentaries = Commentaries.list_commentaries()
    render(conn, "index.html", commentaries: commentaries)
  end

  def new(conn, _params) do
    changeset = Commentaries.change_commentary(%Commentary{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"commentary" => commentary_params}) do
    case Commentaries.create_commentary(commentary_params) do
      {:ok, commentary} ->
        conn
        |> put_flash(:info, "Commentary created successfully.")
        |> redirect(to: Routes.commentary_path(conn, :show, commentary))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    commentary = Commentaries.get_commentary!(id)
    render(conn, "show.html", commentary: commentary)
  end

  def edit(conn, %{"id" => id}) do
    commentary = Commentaries.get_commentary!(id)
    changeset = Commentaries.change_commentary(commentary)
    render(conn, "edit.html", commentary: commentary, changeset: changeset)
  end

  def update(conn, %{"id" => id, "commentary" => commentary_params}) do
    commentary = Commentaries.get_commentary!(id)

    case Commentaries.update_commentary(commentary, commentary_params) do
      {:ok, commentary} ->
        conn
        |> put_flash(:info, "Commentary updated successfully.")
        |> redirect(to: Routes.commentary_path(conn, :show, commentary))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", commentary: commentary, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    commentary = Commentaries.get_commentary!(id)
    {:ok, _commentary} = Commentaries.delete_commentary(commentary)

    conn
    |> put_flash(:info, "Commentary deleted successfully.")
    |> redirect(to: Routes.commentary_path(conn, :index))
  end
end
