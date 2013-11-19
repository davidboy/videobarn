json.array!(@riders) do |rider|
  json.extract! rider, :name, :fav, :notes
  json.url rider_url(rider, format: :json)
end
