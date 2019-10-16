defmodule FmznWeb.ProductPointsControllerTest do
  use FmznWeb.ConnCase

  alias Fmzn.Resources

  @create_attrs %{txt: "some txt"}
  @update_attrs %{txt: "some updated txt"}
  @invalid_attrs %{txt: nil}

  def fixture(:product_points) do
    {:ok, product_points} = Resources.create_product_points(@create_attrs)
    product_points
  end

  describe "index" do
    test "lists all productpoints", %{conn: conn} do
      conn = get(conn, Routes.product_points_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Productpoints"
    end
  end

  describe "new product_points" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.product_points_path(conn, :new))
      assert html_response(conn, 200) =~ "New Product points"
    end
  end

  describe "create product_points" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_points_path(conn, :create), product_points: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.product_points_path(conn, :show, id)

      conn = get(conn, Routes.product_points_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Product points"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_points_path(conn, :create), product_points: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Product points"
    end
  end

  describe "edit product_points" do
    setup [:create_product_points]

    test "renders form for editing chosen product_points", %{conn: conn, product_points: product_points} do
      conn = get(conn, Routes.product_points_path(conn, :edit, product_points))
      assert html_response(conn, 200) =~ "Edit Product points"
    end
  end

  describe "update product_points" do
    setup [:create_product_points]

    test "redirects when data is valid", %{conn: conn, product_points: product_points} do
      conn = put(conn, Routes.product_points_path(conn, :update, product_points), product_points: @update_attrs)
      assert redirected_to(conn) == Routes.product_points_path(conn, :show, product_points)

      conn = get(conn, Routes.product_points_path(conn, :show, product_points))
      assert html_response(conn, 200) =~ "some updated txt"
    end

    test "renders errors when data is invalid", %{conn: conn, product_points: product_points} do
      conn = put(conn, Routes.product_points_path(conn, :update, product_points), product_points: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Product points"
    end
  end

  describe "delete product_points" do
    setup [:create_product_points]

    test "deletes chosen product_points", %{conn: conn, product_points: product_points} do
      conn = delete(conn, Routes.product_points_path(conn, :delete, product_points))
      assert redirected_to(conn) == Routes.product_points_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.product_points_path(conn, :show, product_points))
      end
    end
  end

  defp create_product_points(_) do
    product_points = fixture(:product_points)
    {:ok, product_points: product_points}
  end
end
