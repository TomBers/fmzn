defmodule Fmzn.Repo.Migrations.AddProductSlug do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :slug, :string
    end

    create unique_index(:products, [:slug])
  end
end
