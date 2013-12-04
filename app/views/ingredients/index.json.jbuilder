json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :vegetarian
  json.url ingredient_url(ingredient, format: :json)
end
