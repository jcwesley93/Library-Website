class BooksController < ApplicationController

    before_action :get_book, only: [:show, :update, :remove_author, :add_author]

    def index
        @all_books = Book.all
    end

    def show
    end

    def edit
    end

    def add_author
        id = params[:book][:author_ids]
        @author = Author.find(id)
        if @book.authors.include?(@author)
            redirect_to @book
        else
            @book.authors << @author
            redirect_to @book
        end
    end

    def update
        # id = params[:book][:author_ids]
        # @author = Author.find(id)
        # @book.authors << @author
        # redirect_to @book
    end

    def remove_author
        id = params[:author_id].to_i
        @book.authors.delete(id)
        redirect_to @book
    end

    def destroy
    end

    private

    def get_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:tite, :num_of_pages)
    end

end