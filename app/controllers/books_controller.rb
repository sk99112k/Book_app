class BooksController < ApplicationController


  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    # @user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @Books = Book.all
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
