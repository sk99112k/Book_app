class BooksController < ApplicationController
  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @comment =Comment.new
    @books = Book.all
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new)
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
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end