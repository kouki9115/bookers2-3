class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @user=current_user
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book)
    else
    render :index
    end
  end

  def index
    @book=Book.new
    @books=Book.all
    @user = current_user
  end

  def show
   @books = Book.find(params[:id])
   @user=@books.user
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
