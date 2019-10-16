defmodule Fmzn.Repo.Migrations.CreateAdverts do
  use Ecto.Migration

  def change do
    create table(:adverts) do
      add :img, :string
      add :txt, :string

      timestamps()
    end

  end
end
