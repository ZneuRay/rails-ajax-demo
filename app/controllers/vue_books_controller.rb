class VueBooksController < VueApplicationController

  def index
    respond_to do |format|
      format.html
      format.json {
        books = Book.all
        render json: {books: books}
      }
    end
  end

  def new
    render 'form', locals: {book: VueBook.new}, layout: false
  end
  
end
