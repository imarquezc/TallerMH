json.array!(@clients) do |client|
  json.extract! client, :id, :nombre, :apellido, :direccion, :comuna, :telefono, :celular
  json.url client_url(client, format: :json)
end
