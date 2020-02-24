class BooksController < ApplicationController
 before_action :authenticate_user!

  def index
  	  @books = Book.all
  	  @user = current_user
      @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
      @user = current_user
  end

  def new
  	  @book = Book.new
  end

  def edit
      @book = Book.find(params[:id])
      if @book.user_id != current_user.id
         redirect_to books_path
      end
  end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        if @book.save
          redirect_to book_path(@book.id), notice:'You have created book successfully.'
        else
          @user = current_user
          @books = Book.all
          render :index
        end
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to books_path
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:notice] = " You have updated books successfully. "
      redirect_to book_path(@book.id)
      else
          flash[:notice] = "error"
          render :edit
          end
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
