json.array!(@videos) do |video|
  json.extract! video, :run_id, :filename, :notes
  json.url video_url(video, format: :json)
end
