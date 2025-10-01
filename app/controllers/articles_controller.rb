class ArticlesController < ApplicationController
  def index
    # Get all articles
    @articles= Article.all
  end

  def show
    # Get a single article
    @article = Article.find(params[:id])
  end

  def new
    # Initiates an article only, doesn't save
    @article = Article.new
  end

  def create
    # Initiates and saves an article
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
