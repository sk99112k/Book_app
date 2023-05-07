class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.comment.new(comment_params)
  end

  def destroy
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
　
end
