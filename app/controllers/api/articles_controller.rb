class Api::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles, each_serializer: ArticlesIndexSerializer
  end

  def show
    if article = Article.find(params[:id])
      render json: article, serializer: ArticlesShowSerializer
    else
      render json: { message: 'Something went wrong...' }, status: 422
    end
  end
end
