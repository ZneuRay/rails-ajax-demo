class RemoteBooksController < ApplicationController

  def index
    @books = RemoteBook.all
  end

  def new
    @book = RemoteBook.new
  end

  def create
    @book = RemoteBook.new book_params
    @book.valid? and @book.save!
  end

  def edit
    @book = RemoteBook.find params[:id]
  end

  def update
    @book = RemoteBook.find params[:id]
    @book.update! book_params
  end

  def destroy
    book = RemoteBook.find params[:id]
    book.delete
  end

  def load_table
    render partial: 'table', locals: {books: RemoteBook.all}
  end

  private

  def book_params
    params.require(:remote_book).permit(:isbn, :title, :name, :author, :release_date)
  end
  
end
