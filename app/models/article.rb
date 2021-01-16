class Article < ApplicationRecord
  validates_presence_of :title, :lead, :body
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_one_attached :image

  def image_path
    Rails.env.test? ? ActiveStorage::Blob.service.path_for(image.key) : image.service_url(expires_in: 1.hour, disposition: 'inline')
  end
end
