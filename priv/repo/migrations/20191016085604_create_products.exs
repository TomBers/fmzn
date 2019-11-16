defmodule Fmzn.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :text
      add :img, :string
      add :description, :text
      add :price, :float
      add :discount, :float

      timestamps()
    end

  end
end
