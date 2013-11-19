json.array!(@show_classes) do |show_class|
  json.extract! show_class, :name, :category_id
  json.url show_class_url(show_class, format: :json)
end
