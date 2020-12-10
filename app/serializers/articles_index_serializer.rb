class ArticlesIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :lead, :created

  def created
    object.created_at.strftime('%F')
  end
end
