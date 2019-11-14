defmodule Fmzn.Resources.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Fmzn.Resources.ProductPoints
  alias Fmzn.Resources.Review

  schema "products" do
    field :description, :string
    field :discount, :float
    field :img, :string
    field :price, :float
    field :title, :string
    field :primary_category, :string
    field :secondary_category, :string
    field :slug, :string

    has_many :productpoints, ProductPoints, on_delete: :delete_all
    has_many :reviews, Review, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :img, :description, :price, :discount, :primary_category, :secondary_category, :slug])
    |> unique_constraint(:slug)
    |> cast_assoc(:productpoints, required: true)
    |> cast_assoc(:reviews, required: false)
    |> validate_required([:title, :description, :price, :discount, :slug])
  end

end
