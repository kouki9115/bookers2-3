class UsersController < ApplicationController
  def index
    @book=Book.new
    @users=User.all
    @user = current_user
 
  end

  def show
  
    @user = User.find(params[:id])
    @book=Book.new
    @books=@user.books
    
  end

  def edit
    @user = User.find(current_user.id)
    @users=User.all
  end
  
  def new
    @book=Book.new
  end
 
  def create
    @books=Book.all
    @book=Book.new(book_params)
     @book.user_id = current_user.id 
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to books_path(@book.id)
    else
    render :show
    end  
  end
  
  def update
   @user=User.find(params[:id])
  @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
   redirect_to user_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :image_id, )
  end
  
  protect_from_forgery with: :null_session
  
end
