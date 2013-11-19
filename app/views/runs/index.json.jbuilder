json.array!(@runs) do |run|
  json.extract! run, :show_id, :rider_id, :horse_id, :classification, :category, :time, :placing, :penalty, :fav, :notes
  json.url run_url(run, format: :json)
end
