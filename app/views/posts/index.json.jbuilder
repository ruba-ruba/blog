json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :published, :content, :type
  json.url post_url(post, format: :json)
end
