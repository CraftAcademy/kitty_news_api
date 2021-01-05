class Api::CategoriesController < ApplicationController
  def show
    category = Category.find_by(label: params["id"])
    render json: {category: {lable: category.label, articles: category.articles}}
  end
end
