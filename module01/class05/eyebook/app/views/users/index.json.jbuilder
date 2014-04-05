json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :age, :gender, :bio, :username, :born_at, :address, :telephone, :credits, :credits
  json.url user_url(user, format: :json)
end
