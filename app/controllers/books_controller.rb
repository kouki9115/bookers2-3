class BooksController < ApplicationController
  def new
    @book=Book.new
  end
 
  def create
    @books=Book.all
    @book=Book.new(book_params)
    @book.user_id = current_user.id 
    if @book.save
    redirect_to books_path(@book.id)
    else
    render :index
    end 
  end

  def index
    @book=Book.new
    @books=Book.all
  end
  
  def show
   @book = Book.find(params[:id])
   @books=Book.all
   @book=Book.new
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
  protect_from_forgery with: :null_session
end
