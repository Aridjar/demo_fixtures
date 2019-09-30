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
        {:ok, post} =
          attrs
          |> Enum.into(@valid_attrs)
          |> Posts.create_post()

        post
      end

    end
  end

  defmacro __using__(fixtures) when is_list(fixtures) do
    for fixture <- fixtures, is_atom(fixture), do: apply(__MODULE__, fixture, [])
  end
end