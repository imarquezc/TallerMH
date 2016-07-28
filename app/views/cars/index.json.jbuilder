json.array!(@cars) do |car|
  json.extract! car, :id, :marca, :modelo, :kilometraje, :color, :comentarios
  json.url car_url(car, format: :json)
end
