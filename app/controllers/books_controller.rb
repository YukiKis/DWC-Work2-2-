class BooksController < ApplicationController
  def index
    @books = Book.all
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book_new = Book.new(book_params)
    if book_new.save
      redirect_to book_path(book_new.id), notice: "Success!!"
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id), notice: "Success!!"
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Success!!"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
