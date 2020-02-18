class BooksController < ApplicationController
  def index
  	  @books = Book.all
  	  @book = Book.new
  end

  def show
  end

  def new
  	  @book = Book.new
  end

  def edit
  end

  def create
  	  book = Book.new(book_params)
  	  book.save
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to books_path
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
