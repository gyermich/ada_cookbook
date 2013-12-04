json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :description, :process, :vegetarian
  json.url recipe_url(recipe, format: :json)
end
