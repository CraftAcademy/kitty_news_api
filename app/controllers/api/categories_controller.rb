class Api::CategoriesController < ApplicationController
  def show
    category = Category.find_by(label: params['id'])
    render json: category, serializer: CategoriesShowSerializer
  rescue StandardError => e
    render json: { message: 'Something went wrong, this category was not found' }, status: 404
  end
end
