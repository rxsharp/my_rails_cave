json.array!(@learning_tools) do |learning_tool|
  json.extract! learning_tool, :id, :learning_material, :learning_section, :progress, :user_id
  json.url learning_tool_url(learning_tool, format: :json)
end
