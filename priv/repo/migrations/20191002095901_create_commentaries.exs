defmodule DemoFixtures.Repo.Migrations.CreateCommentaries do
  use Ecto.Migration

  def change do
    create table(:commentaries) do
      add :content, :string
      add :post_id, references(:posts, on_delete: :nothing)

      timestamps()
    end

    create index(:commentaries, [:post_id])
  end
end
