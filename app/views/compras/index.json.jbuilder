json.array!(@compras) do |compra|
  json.extract! compra, :id, :producto, :p_compra, :p_venta, :cantidad
  json.url compra_url(compra, format: :json)
end
