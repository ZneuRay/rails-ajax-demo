class JqueryBooksController < ApplicationController

  layout false, except: [:index]

  def index

  end

  def new
    @book = JqueryBook.new
  end

  def create
    book = JqueryBook.new book_params
    if book.valid? and book.save
      render json: {status: 0, message: "「#{book.name}」 have been created successfully."}
    else
      render json: {status: 1, message: "Fail to create the book. #{book.errors.messages}"}
    end
  end

  def edit
    @book = JqueryBook.find params[:id]
  end

  def update
    book = Book.find params[:id]
    if book.update book_params
      render json: {status: 0, message: "「#{book.name}」 have been updated successfully."}
    else
      render json: {status: 1, message: "Fail to update the book. #{book.errors.messages}"}
    end
  end

  def destroy
    book = JqueryBook.find params[:id]
    if book.delete
      render json: {status: 0, message: "「#{book.name}」 have been deleted successfully."}
    else
      render json: {status: 1, message: "Fail to delete the book. #{book.errors.messages}"}
    end
  end

  def load_table
    render partial: 'table', locals: {books: JqueryBook.all}
  end

  private

  def book_params
    params.require(:jquery_book).permit(:isbn, :title, :name, :author, :release_date)
  end
  
end
