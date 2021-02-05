class BookCommentsController < ApplicationController
  
  def create
    # binding.pry
   @book = Book.find(params[:book_id])
   @comment = BookComment.new(book_comment_params)
   @comment.user_id = current_user.id
   @comment.book_id = @book.id
  @comment.save
    # render 'comment_index'
  # redirect_to request.referer
  end
  
  def destroy
  @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
  @comment.destroy
  @book=Book.find(params[:book_id])
  # render :comment_index
  # redirect_to request.referer
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end
    