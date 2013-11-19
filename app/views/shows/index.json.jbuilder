json.array!(@shows) do |show|
  json.extract! show, :name, :date, :double_judged, :notes
  json.url show_url(show, format: :json)
end
