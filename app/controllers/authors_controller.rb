class AuthorsController < ApplicationController

    before_action :get_author, only: [:show, :edit, :update, :destroy]
    
    def index
        @all_authors = Author.all
    end

    def show 
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.create(author_params)
        if @author.valid? 
            redirect_to @author
        else
            render :new
        end
    end

    def edit
    end

    def update #Old values not saved. 
        @author.update(author_params)
        if @author.valid?
            redirect_to @author
        else
            render :edit
        end
    end

    def destroy 
        @author.destroy
        redirect_to authors_path
    end

    private 

    def get_author
        @author = Author.find(params[:id])
    end

    def author_params
        params.require(:author).permit(:name, :birth_year)
    end



    
end
