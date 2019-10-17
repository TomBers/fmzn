defmodule Load_CSV do

  alias Fmzn.Resources

  def run do
    NimbleCSV.define(MyParser, separator: ",", escape: "\"")

    "tst.csv"
    |> File.stream!
    |> MyParser.parse_stream
    |> Enum.map(fn [timestamp, title, description, category, price, secondary_category, bp1, bp2, bp3] -> add_new_product(title, description, category, price, secondary_category, bp1, bp2, bp3) end)
  end

  def add_new_product(title, description, category, price, secondary_category, bp1, bp2, bp3) do
    Resources.create_product(%{title: title, description: description, discount: 0.2, primary_category: category, secondary_category: secondary_category, price: price, productpoints: [%{txt: bp1}, %{txt: bp2}, %{txt: bp3} ]})
  end

end
