defmodule Fmzn.Resources.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :description, :string
    field :score, :integer
    field :product_id, :id

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:score, :description, :product_id])
    |> validate_required([:score, :description, :product_id])
  end
end
