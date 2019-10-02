defmodule DemoFixtures.Fixtures do

  alias DemoFixtures.Repo

  def post do
    quote do
      alias DemoFixtures.{Posts, Posts.Post}

      @valid_attrs %{content: "some content", title: "some title"}
      @update_attrs %{content: "some updated content", title: "some updated title"}
      @invalid_attrs %{content: nil, title: nil}

      def create_post(_ \\ nil) do
        post = post_fixture()
        %{post: post}
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

      def create_commentary(_ \\ nil) do
        commentary = commentary_fixture()
        %{commentary: commentary}
      end

      def commentary_fixture(attrs \\ %{}) do
        commentary = create_commentary_attrs()

        attrs
        |> Enum.into(commentary)
        |> unquote(__MODULE__).general_fixture(&Commentaries.create_commentary/1)
      end

      def create_commentary_attrs() do
        __MODULE__.create_post()
        |> Enum.into(@valid_attrs)
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