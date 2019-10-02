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
    |> validate_required([:content])
  end
end
