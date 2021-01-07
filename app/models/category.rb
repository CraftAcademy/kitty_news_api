class Category < ApplicationRecord
  validates_presence_of :label
  has_many :articles
  enum label: [:global_politics, :sports, :self_care, :news, :culture]
end
