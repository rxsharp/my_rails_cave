json.array!(@hub_lists) do |hub_list|
  json.extract! hub_list, :id, :github, :bitbucket, :codepen, :user_id
  json.url hub_list_url(hub_list, format: :json)
end
