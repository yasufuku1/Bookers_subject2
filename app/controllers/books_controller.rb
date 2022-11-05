class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      flash[:notice] = ""
    end
  end

  def index
    @books = Book.all

    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
