alias Fmzn.Resources

defmodule Fmzn.LoadProducts do


  def load_json_web do
    web_request("https://tombers.github.io/fmzn/products.json")
    |> store_entries
  end

  def load_json_local do
    {:ok, json} = get_json_data("products.json")
    store_entries(json)
  end

  def store_entries(entries) do
    entries |> Enum.reduce(0, fn(entry, acc) -> insert_product(entry, acc) end)
  end

  def insert_product(entry, acc) do
    case Resources.create_product(convert_entry_to_dict(entry)) do
      {:ok, _} -> acc + 1
      {:error, _} -> acc
      end
    end


  def web_request(url) do
    HTTPoison.start
    case HTTPoison.get url do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> Jason.decode!(body)
    _ -> {:error}
    end
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