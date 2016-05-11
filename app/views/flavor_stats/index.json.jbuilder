json.array!(@flavor_stats) do |flavor_stat|
  json.extract! flavor_stat, :id
  json.url flavor_stat_url(flavor_stat, format: :json)
end
