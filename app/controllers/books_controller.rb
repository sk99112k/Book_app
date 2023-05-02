class BooksController < ApplicationController

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book_new = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:success] = "You have updated book successfully."
    redirect_to user_path(current_user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
