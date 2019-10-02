defmodule DemoFixtures.Commentaries.Commentary do
  use Ecto.Schema
  import Ecto.Changeset

  alias DemoFixtures.Posts.Post

  schema "commentaries" do
    field :content, :string
    belongs_to :post, Post, on_replace: :update

    timestamps()
  end

  @doc false
  def changeset(commentary, attrs) do
    commentary
    |> cast(attrs, [:content])
    |> add_post(attrs)
    |> validate_required([:content, :post])
  end

  defp add_post(changeset, %{"post" => post}),
    do: put_assoc(changeset, :post, post)

  defp add_post(changeset, %{post: post}), do: put_assoc(changeset, :post, post)
  defp add_post(changeset, _), do: changeset
end
