class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:successfully] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
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
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:successfully] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      @book = book
      render :edit
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:successfully] = "Book was successfully destroyed."
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
