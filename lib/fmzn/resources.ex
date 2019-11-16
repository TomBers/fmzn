defmodule Fmzn.Resources do
  @moduledoc """
  The Resources context.
  """

  import Ecto.Query, warn: false
  alias Fmzn.Repo

  alias Fmzn.Resources.Product
  alias Fmzn.Resources.Review

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  def find_products(product_list) do
    from(p in Product, where: p.slug in ^product_list)
    |> Repo.all()
  end

  def find_products_by_category(category) do
    from(p in Product, where: p.primary_category == ^category)
    |> Repo.all()
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id) |> Repo.preload([:productpoints, :reviews])

  def get_product_by_slug!(slug), do: Repo.get_by!(Product, slug: slug) |> Repo.preload([:productpoints, :reviews])

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{source: %Product{}}

  """
  def change_product(%Product{} = product) do
    Product.changeset(product, %{})
  end


  alias Fmzn.Resources.ProductPoints

  @doc """
  Returns the list of productpoints.

  ## Examples

      iex> list_productpoints()
      [%ProductPoints{}, ...]

  """
  def list_productpoints do
    Repo.all(ProductPoints)
  end

  @doc """
  Gets a single product_points.

  Raises `Ecto.NoResultsError` if the Product points does not exist.

  ## Examples

      iex> get_product_points!(123)
      %ProductPoints{}

      iex> get_product_points!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product_points!(id), do: Repo.get!(ProductPoints, id)

  @doc """
  Creates a product_points.

  ## Examples

      iex> create_product_points(%{field: value})
      {:ok, %ProductPoints{}}

      iex> create_product_points(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product_points(attrs \\ %{}) do
    %ProductPoints{}
    |> ProductPoints.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product_points.

  ## Examples

      iex> update_product_points(product_points, %{field: new_value})
      {:ok, %ProductPoints{}}

      iex> update_product_points(product_points, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product_points(%ProductPoints{} = product_points, attrs) do
    product_points
    |> ProductPoints.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ProductPoints.

  ## Examples

      iex> delete_product_points(product_points)
      {:ok, %ProductPoints{}}

      iex> delete_product_points(product_points)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product_points(%ProductPoints{} = product_points) do
    Repo.delete(product_points)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product_points changes.

  ## Examples

      iex> change_product_points(product_points)
      %Ecto.Changeset{source: %ProductPoints{}}

  """
  def change_product_points(%ProductPoints{} = product_points) do
    ProductPoints.changeset(product_points, %{})
  end

  alias Fmzn.Resources.Review

  @doc """
  Returns the list of reviews.

  ## Examples

      iex> list_reviews()
      [%Review{}, ...]

  """
  def list_reviews do
    Repo.all(Review)
  end

  @doc """
  Gets a single review.

  Raises `Ecto.NoResultsError` if the Review does not exist.

  ## Examples

      iex> get_review!(123)
      %Review{}

      iex> get_review!(456)
      ** (Ecto.NoResultsError)

  """
  def get_review!(id), do: Repo.get!(Review, id)

  @doc """
  Creates a review.

  ## Examples

      iex> create_review(%{field: value})
      {:ok, %Review{}}

      iex> create_review(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_review(attrs \\ %{}) do
    %Review{}
    |> Review.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a review.

  ## Examples

      iex> update_review(review, %{field: new_value})
      {:ok, %Review{}}

      iex> update_review(review, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_review(%Review{} = review, attrs) do
    review
    |> Review.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Review.

  ## Examples

      iex> delete_review(review)
      {:ok, %Review{}}

      iex> delete_review(review)
      {:error, %Ecto.Changeset{}}

  """
  def delete_review(%Review{} = review) do
    Repo.delete(review)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking review changes.

  ## Examples

      iex> change_review(review)
      %Ecto.Changeset{source: %Review{}}

  """
  def change_review(%Review{} = review) do
    Review.changeset(review, %{})
  end

  alias Fmzn.Resources.Advert

  @doc """
  Returns the list of adverts.

  ## Examples

      iex> list_adverts()
      [%Advert{}, ...]

  """
  def list_adverts do
    Repo.all(Advert)
  end

  @doc """
  Gets a single advert.

  Raises `Ecto.NoResultsError` if the Advert does not exist.

  ## Examples

      iex> get_advert!(123)
      %Advert{}

      iex> get_advert!(456)
      ** (Ecto.NoResultsError)

  """
  def get_advert!(id), do: Repo.get!(Advert, id)

  def get_advert(id), do: Repo.get(Advert, id)

  @doc """
  Creates a advert.

  ## Examples

      iex> create_advert(%{field: value})
      {:ok, %Advert{}}

      iex> create_advert(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_advert(attrs \\ %{}) do
    %Advert{}
    |> Advert.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a advert.

  ## Examples

      iex> update_advert(advert, %{field: new_value})
      {:ok, %Advert{}}

      iex> update_advert(advert, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_advert(%Advert{} = advert, attrs) do
    advert
    |> Advert.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Advert.

  ## Examples

      iex> delete_advert(advert)
      {:ok, %Advert{}}

      iex> delete_advert(advert)
      {:error, %Ecto.Changeset{}}

  """
  def delete_advert(%Advert{} = advert) do
    Repo.delete(advert)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking advert changes.

  ## Examples

      iex> change_advert(advert)
      %Ecto.Changeset{source: %Advert{}}

  """
  def change_advert(%Advert{} = advert) do
    Advert.changeset(advert, %{})
  end
end
