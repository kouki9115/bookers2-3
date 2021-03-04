class UsersController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books=Book.all
    @book=Book.new
  end

  def edit
  end
  
  def new
    @book=Book.new
  end
 
  def create
    @books=Book.all
    @book=Book.new(book_params)
    @book.save
    redirect_to books_path(@book.id)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  protect_from_forgery with: :null_session
  
end
