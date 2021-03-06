class UsersController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
    @users=User.all
  end

  def show
    @user = User.find(params[:id])
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
     @book.user_id = current_user.id 
    if @book.save
    redirect_to books_path(@book.id)
    else
    render :show
    end  
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  protect_from_forgery with: :null_session
  
end
