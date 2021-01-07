class Api::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles, each_serializer: ArticlesIndexSerializer
  end

  def show
    article = Article.find(params[:id])
    render json: article, serializer: ArticlesShowSerializer
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: 'Something went wrong, this article was not found' }, status: 404
  end

  def create
    article = Article.create(article_params)
    if article.persisted?
      binding.pry
      render json: { message: 'Your article was successfully created!' }, status: 201
    else
      render json: { message: article.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :lead, :body, :category_id)
  end
end
