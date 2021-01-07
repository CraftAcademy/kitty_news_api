class CategoriesShowSerializer < ActiveModel::Serializer
  attributes :id, :label
  has_many :articles, serializer: ArticlesShowSerializer
end
