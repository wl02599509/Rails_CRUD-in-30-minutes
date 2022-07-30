class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to '/books', notice: 'Created!!'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to '/books', notice: 'Edited!!'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to '/books', notice: 'DELETED!!!!'
  end

  private
  def book_params
    params.require(:book).permit(:title, :content, :price)
  end

  def find_book
    @book = Book.find_by(id: params[:id])
  end
end
