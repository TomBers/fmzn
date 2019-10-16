defmodule Fmzn.Repo.Migrations.AddCategory do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :primary_category, :string
      add :secondary_category, :string
    end
  end
end
