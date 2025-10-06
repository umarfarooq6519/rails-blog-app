class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    attrs = comment_params
    # Ensure a valid status if the model validates it but the form doesn't send it
    attrs[:status] = "public" 
    @comment = @article.comments.create(attrs)
    redirect_to article_path(@article)
  end

  def destroy

    
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
