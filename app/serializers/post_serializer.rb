class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :content_type
end
