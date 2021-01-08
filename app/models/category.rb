class Category < ApplicationRecord
  validates_presence_of :label
  has_many :articles
end
