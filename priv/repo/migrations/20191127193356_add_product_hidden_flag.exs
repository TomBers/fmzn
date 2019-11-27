defmodule Fmzn.Repo.Migrations.AddProductHiddenFlag do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :visible, :boolean, default: true
    end
  end
end
