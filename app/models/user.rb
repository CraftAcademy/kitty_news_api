# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models

  after_initialize :set_default_role, if: :new_record?

  enum role: %i[registered_user journalist]

  has_many :articles, foreign_key: 'author_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  private

  def set_default_role
    self.role ||= :registered_user
  end
end
