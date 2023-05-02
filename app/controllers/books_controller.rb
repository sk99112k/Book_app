class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @book_new = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
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
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end
