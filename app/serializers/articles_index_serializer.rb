class ArticlesIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :lead, :body, :created

  def created
    object.created_at.strftime('%F')
  end
end
