class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'Article was saved succesfully'
    else
      flash.now[:notice] = 'Could not update it.'
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
