class ArticlesIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :lead, :created, :image, :category

  def created
    object.created_at.strftime('%F')
  end

  def image
    return nil unless object.image.attached?

    object.image_path
  end

  def category
    object.category.label
  end
end
