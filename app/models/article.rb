class Article < ApplicationRecord
  validates_presence_of :title, :lead, :body
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_one_attached :image
end
