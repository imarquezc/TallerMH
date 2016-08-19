json.array!(@comments) do |comment|
  json.extract! comment, :id, :detalle, :precio
  json.url comment_url(comment, format: :json)
end
