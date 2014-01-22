json.array!(@hubs) do |hub|
  json.extract! hub, :id
  json.url hub_url(hub, format: :json)
end
