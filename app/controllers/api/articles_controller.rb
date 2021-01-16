class Api::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[create show]
  before_action :is_user_journalist?, only: [:create]

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
    article = current_user.articles.create(article_params)
    if article.persisted? && attach_image(article)
      render json: { message: 'Your article was successfully created!' }, status: 201
    else
      render json: { message: article.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :lead, :body, :category_id)
  end

  def is_user_journalist?
    unless current_user.journalist?
      render json: { message: 'You are not authorized to create an article.' }, status: 401
    end
  end

  def attach_image(article)
    params_image = params[:article][:image]
    DecodeService.attach_image(params_image, article.image) if params_image.present?
  end
end
