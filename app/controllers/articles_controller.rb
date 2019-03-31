class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]

  def index
    @articles = Article.all
  end

  def show
    #dry up with set_article
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to article_path(@article)
  end

  def edit
    #dry up with set_article
    # @article = Article.find(params[:id])
  end

  def update
    #dry up with set_article
    # @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    # Article.destroy(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
