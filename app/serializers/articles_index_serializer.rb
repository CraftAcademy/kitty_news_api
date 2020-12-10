class ArticlesIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :lead, :body
end
