json.array!(@scores) do |score|
  json.extract! score, :event_id, :position, :angler, :angler_rewards, :co_angler, :co_angler_rewards, :weight, :bf, :hp
  json.url score_url(score, format: :json)
end