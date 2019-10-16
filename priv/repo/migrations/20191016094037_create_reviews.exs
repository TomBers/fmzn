defmodule Fmzn.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :score, :integer
      add :description, :string
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:reviews, [:product_id])
  end
end
