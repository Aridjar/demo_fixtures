defmodule DemoFixtures.Fixtures do

  def post do
    quote do
      alias DemoFixtures.{Posts, Posts.Post}

      @valid_attrs %{content: "some content", title: "some title"}
      @update_attrs %{content: "some updated content", title: "some updated title"}
      @invalid_attrs %{content: nil, title: nil}

      defp create_post(_) do
        post = post_fixture()
        {:ok, post: post}
      end

      defp post_fixture(attrs \\ %{}) do
        attrs
        |> Enum.into(@valid_attrs)
        |> unquote(__MODULE__).general_fixture(&Posts.create_post/1)
      end

    end
  end

  def commentary do
    quote do
      alias DemoFixtures.{Commentaries, Commentaries.Commentary}

      @valid_attrs %{content: "some content"}
      @update_attrs %{content: "some updated content"}
      @invalid_attrs %{content: nil}

      defp create_commentary(_) do
        commentary = commentary_fixture()
        {:ok, commentary: commentary}
      end

      def commentary_fixture(attrs \\ %{}) do
        attrs
        |> Enum.into(@valid_attrs)
        |> unquote(__MODULE__).general_fixture(&Commentaries.create_commentary/1)
      end
    end
  end

  defmacro __using__(fixtures) when is_list(fixtures) do
    for fixture <- fixtures, is_atom(fixture), do: apply(__MODULE__, fixture, [])
  end

  def general_fixture(attrs, create) do
    {:ok, entity} =
      attrs
      |> create.()

    entity
  end
end