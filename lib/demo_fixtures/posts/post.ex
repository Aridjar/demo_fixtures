defmodule DemoFixtures.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias DemoFixtures.Commentaries.Commentary

  schema "posts" do
    field :content, :string
    field :title, :string
    has_many :commentaries, Commentary, foreign_key: :post_id, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
