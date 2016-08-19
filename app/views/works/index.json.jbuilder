json.array!(@works) do |work|
  json.extract! work, :id, :motivo, :tipo, :kilometraje, :estanque
  json.url work_url(work, format: :json)
end
