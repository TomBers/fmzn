defmodule Fmzn.Resources.Advert do
  use Ecto.Schema
  import Ecto.Changeset

  schema "adverts" do
    field :img, :string
    field :txt, :string

    timestamps()
  end

  @doc false
  def changeset(advert, attrs) do
    advert
    |> cast(attrs, [:img, :txt])
    |> validate_required([:img, :txt])
  end
end
