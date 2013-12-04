json.array!(@cookbooks) do |cookbook|
  json.extract! cookbook, :id, :name, :user_id
  json.url cookbook_url(cookbook, format: :json)
end
