class Api::CategoriesController < ApplicationController
  def show
    catefory = Category.find_cy(label: params["id"])
    render json: {category: {lable: category.label, articles: category.articles}}
  end
end
