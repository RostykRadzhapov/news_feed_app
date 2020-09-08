# frozen_string_literal: true

class ArticlesController < ApplicationController
  load_and_authorize_resource find_by: :slug
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice: 'Article was successfully created.'
    else
      render :new, notice: 'Article not created.'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: 'Article was successfully updated.'
    else
      render :edit, notice: 'Article not updated.'
    end
  end

  def destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.' if @article.destroy
  end

  private

  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :link, :public, images: [], videos: [])
  end
end
