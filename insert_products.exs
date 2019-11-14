  alias Fmzn.Resources


  NimbleCSV.define(MyParser, separator: ",", escape: "\"")

    "products.csv"
    |> File.stream!
    |> MyParser.parse_stream
    |> Enum.map(fn [title, description, category, secondary_category, price, discount, bp1, bp2, bp3] -> Resources.create_product(%{title: title, description: description, discount: discount, primary_category: category, secondary_category: secondary_category, price: price, productpoints: [%{txt: bp1}, %{txt: bp2}, %{txt: bp3} ], slug: title |> String.downcase |> String.replace(" ", "-")}) end)
