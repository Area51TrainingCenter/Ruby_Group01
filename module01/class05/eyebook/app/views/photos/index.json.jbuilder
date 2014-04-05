json.array!(@photos) do |photo|
  json.extract! photo, :id, :title, :copyright
  json.url photo_url(photo, format: :json)
end
