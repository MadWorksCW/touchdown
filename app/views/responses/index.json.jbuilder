json.array!(@responses) do |response|
  json.extract! response, :id, :name, :email
  json.url response_url(response, format: :json)
end
