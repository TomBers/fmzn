defmodule Fmzn.Repo.Migrations.CreateProductpoints do
  use Ecto.Migration

  def change do
    create table(:productpoints) do
      add :txt, :text
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:productpoints, [:product_id])
  end
end
