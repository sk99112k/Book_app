class BooksController < ApplicationController


  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    # @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def index
    @book_new = Book.new
    @books = Book.all
    # @book = Book.find(params[:id])
    # @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
