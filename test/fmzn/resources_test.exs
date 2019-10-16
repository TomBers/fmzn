defmodule Fmzn.ResourcesTest do
  use Fmzn.DataCase

  alias Fmzn.Resources

  describe "products" do
    alias Fmzn.Resources.Product

    @valid_attrs %{description: "some description", discount: 120.5, img: "some img", price: 120.5, title: "some title"}
    @update_attrs %{description: "some updated description", discount: 456.7, img: "some updated img", price: 456.7, title: "some updated title"}
    @invalid_attrs %{description: nil, discount: nil, img: nil, price: nil, title: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resources.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Resources.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Resources.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Resources.create_product(@valid_attrs)
      assert product.description == "some description"
      assert product.discount == 120.5
      assert product.img == "some img"
      assert product.price == 120.5
      assert product.title == "some title"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Resources.update_product(product, @update_attrs)
      assert product.description == "some updated description"
      assert product.discount == 456.7
      assert product.img == "some updated img"
      assert product.price == 456.7
      assert product.title == "some updated title"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_product(product, @invalid_attrs)
      assert product == Resources.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Resources.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Resources.change_product(product)
    end
  end

  describe "productpoints" do
    alias Fmzn.Resources.ProductPoints

    @valid_attrs %{txt: "some txt"}
    @update_attrs %{txt: "some updated txt"}
    @invalid_attrs %{txt: nil}

    def product_points_fixture(attrs \\ %{}) do
      {:ok, product_points} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resources.create_product_points()

      product_points
    end

    test "list_productpoints/0 returns all productpoints" do
      product_points = product_points_fixture()
      assert Resources.list_productpoints() == [product_points]
    end

    test "get_product_points!/1 returns the product_points with given id" do
      product_points = product_points_fixture()
      assert Resources.get_product_points!(product_points.id) == product_points
    end

    test "create_product_points/1 with valid data creates a product_points" do
      assert {:ok, %ProductPoints{} = product_points} = Resources.create_product_points(@valid_attrs)
      assert product_points.txt == "some txt"
    end

    test "create_product_points/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_product_points(@invalid_attrs)
    end

    test "update_product_points/2 with valid data updates the product_points" do
      product_points = product_points_fixture()
      assert {:ok, %ProductPoints{} = product_points} = Resources.update_product_points(product_points, @update_attrs)
      assert product_points.txt == "some updated txt"
    end

    test "update_product_points/2 with invalid data returns error changeset" do
      product_points = product_points_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_product_points(product_points, @invalid_attrs)
      assert product_points == Resources.get_product_points!(product_points.id)
    end

    test "delete_product_points/1 deletes the product_points" do
      product_points = product_points_fixture()
      assert {:ok, %ProductPoints{}} = Resources.delete_product_points(product_points)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_product_points!(product_points.id) end
    end

    test "change_product_points/1 returns a product_points changeset" do
      product_points = product_points_fixture()
      assert %Ecto.Changeset{} = Resources.change_product_points(product_points)
    end
  end

  describe "reviews" do
    alias Fmzn.Resources.Review

    @valid_attrs %{description: "some description", score: 42}
    @update_attrs %{description: "some updated description", score: 43}
    @invalid_attrs %{description: nil, score: nil}

    def review_fixture(attrs \\ %{}) do
      {:ok, review} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resources.create_review()

      review
    end

    test "list_reviews/0 returns all reviews" do
      review = review_fixture()
      assert Resources.list_reviews() == [review]
    end

    test "get_review!/1 returns the review with given id" do
      review = review_fixture()
      assert Resources.get_review!(review.id) == review
    end

    test "create_review/1 with valid data creates a review" do
      assert {:ok, %Review{} = review} = Resources.create_review(@valid_attrs)
      assert review.description == "some description"
      assert review.score == 42
    end

    test "create_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_review(@invalid_attrs)
    end

    test "update_review/2 with valid data updates the review" do
      review = review_fixture()
      assert {:ok, %Review{} = review} = Resources.update_review(review, @update_attrs)
      assert review.description == "some updated description"
      assert review.score == 43
    end

    test "update_review/2 with invalid data returns error changeset" do
      review = review_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_review(review, @invalid_attrs)
      assert review == Resources.get_review!(review.id)
    end

    test "delete_review/1 deletes the review" do
      review = review_fixture()
      assert {:ok, %Review{}} = Resources.delete_review(review)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_review!(review.id) end
    end

    test "change_review/1 returns a review changeset" do
      review = review_fixture()
      assert %Ecto.Changeset{} = Resources.change_review(review)
    end
  end

  describe "adverts" do
    alias Fmzn.Resources.Advert

    @valid_attrs %{img: "some img", txt: "some txt"}
    @update_attrs %{img: "some updated img", txt: "some updated txt"}
    @invalid_attrs %{img: nil, txt: nil}

    def advert_fixture(attrs \\ %{}) do
      {:ok, advert} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resources.create_advert()

      advert
    end

    test "list_adverts/0 returns all adverts" do
      advert = advert_fixture()
      assert Resources.list_adverts() == [advert]
    end

    test "get_advert!/1 returns the advert with given id" do
      advert = advert_fixture()
      assert Resources.get_advert!(advert.id) == advert
    end

    test "create_advert/1 with valid data creates a advert" do
      assert {:ok, %Advert{} = advert} = Resources.create_advert(@valid_attrs)
      assert advert.img == "some img"
      assert advert.txt == "some txt"
    end

    test "create_advert/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_advert(@invalid_attrs)
    end

    test "update_advert/2 with valid data updates the advert" do
      advert = advert_fixture()
      assert {:ok, %Advert{} = advert} = Resources.update_advert(advert, @update_attrs)
      assert advert.img == "some updated img"
      assert advert.txt == "some updated txt"
    end

    test "update_advert/2 with invalid data returns error changeset" do
      advert = advert_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_advert(advert, @invalid_attrs)
      assert advert == Resources.get_advert!(advert.id)
    end

    test "delete_advert/1 deletes the advert" do
      advert = advert_fixture()
      assert {:ok, %Advert{}} = Resources.delete_advert(advert)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_advert!(advert.id) end
    end

    test "change_advert/1 returns a advert changeset" do
      advert = advert_fixture()
      assert %Ecto.Changeset{} = Resources.change_advert(advert)
    end
  end
end
