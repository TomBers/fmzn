alias Fmzn.Resources

defmodule Fmzn.LoadProducts do

  def run do

    NimbleCSV.define(MyParser, separator: ",", escape: "\"")

    "products.csv"
    |> File.stream!
    |> MyParser.parse_stream
    |> Enum.map(fn [title, description, category, secondary_category, price, discount, bp1, bp2, bp3] -> Resources.create_product(%{title: title, description: description, discount: discount, primary_category: category, secondary_category: secondary_category, price: price, productpoints: [%{txt: bp1}, %{txt: bp2}, %{txt: bp3} ], slug: title |> String.downcase |> String.replace(" ", "-")}) end)

  end

  def load_json do
    {:ok, json} = get_json_data("products.json")

    json
    |> Enum.map(fn(entry) -> Resources.create_product(convert_entry_to_dict(entry)) end)

  end

  def get_json_data(filename) do
      with {:ok, body} <- File.read(filename),
           {:ok, json} <- Jason.decode(body), do: {:ok, json}
  end

  def convert_entry_to_dict(entry) do
    %{title: entry["title"],
      description: entry["description"],
      discount: entry["discount"],
      primary_category: entry["primary_category"],
      secondary_category: entry["secondary_category"],
      price: entry["price"],
      productpoints: [%{txt: entry["bp1"]}, %{txt: entry["bp2"]}, %{txt: entry["bp3"]} ],
      slug: entry["title"] |> String.downcase |> String.replace(" ", "-")}
  end

end