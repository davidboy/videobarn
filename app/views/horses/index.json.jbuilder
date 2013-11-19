json.array!(@horses) do |horse|
  json.extract! horse, :name, :notes
  json.url horse_url(horse, format: :json)
end
