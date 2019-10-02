defmodule DemoFixtures.Commentaries.Commentary do
  use Ecto.Schema
  import Ecto.Changeset

  schema "commentaries" do
    field :content, :string
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(commentary, attrs) do
    commentary
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
