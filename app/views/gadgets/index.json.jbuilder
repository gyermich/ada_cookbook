json.array!(@gadgets) do |gadget|
  json.extract! gadget, :id, :name
  json.url gadget_url(gadget, format: :json)
end
