class BooksController < ApplicationController

  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find params[:id]
  end
  
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new book_params
    if book.valid? and book.save
      redirect_to books_path, notice: "「#{book.name}」 have been created successfully."
    else
      redirect_to :back, alert: "Fail to create the book. #{book.errors.messages}"
    end
    
  end

  def edit
    @book = Book.find params[:id]
  end
  
  def update
    book = Book.find params[:id]
    if book.update book_params
      redirect_to books_path, notice: "「#{book.name}」 have been updated successfully."
    else
      redirect_to :back, alert: "Fail to update the book. #{book.errors.messages}"
    end
  end

  def destroy
    book = Book.find params[:id]
    if book.delete
      redirect_to books_path, notice: "「#{book.name}」 have been deleted successfully."
    else
      redirect_to :back, alert: "Fail to delete the book. #{book.errors.messages}"
    end
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :name, :author, :release_date)
  end
  
end
