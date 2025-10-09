class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "123", except: [ :index, :show ]
   allow_browser versions: :modern

  before_action :authenticate_user!

  def index
    # Paginated, filtered list (exclude archived)
    scope = Article.where.not(status: "archived").order(created_at: :desc)
    @articles = scope.page(params[:page])

    respond_to do |format|
      format.html # renders app/views/articles/index.html.erb
      format.json do
        render json: {
          data: @articles,
          meta: {
            current_page: @articles.current_page,
            next_page: @articles.next_page,
            prev_page: @articles.prev_page,
            total_pages: @articles.total_pages,
            total_count: @articles.total_count
          }
        }
      end
    end
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
