json.array!(@learning_statuses) do |learning_status|
  json.extract! learning_status, :id, :learning_status, :user_id
  json.url learning_status_url(learning_status, format: :json)
end
