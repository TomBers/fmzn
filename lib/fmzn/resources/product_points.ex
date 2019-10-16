defmodule Fmzn.Resources.ProductPoints do
  use Ecto.Schema
  import Ecto.Changeset

  schema "productpoints" do
    field :txt, :string
    field :product_id, :id

    timestamps()
  end

  @doc false
  def changeset(product_points, attrs) do
    product_points
    |> cast(attrs, [:txt])
    |> validate_required([:txt])
  end
end
