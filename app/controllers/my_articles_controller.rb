class MyArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = MyArticle.all
    end

    def show
    end

    def new
        @article = MyArticle.new
    end

    def create
        @article = MyArticle.new(my_article_params)
        if @article.valid?
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else 
            flash[:errors] = @article.errors.full_messages
            redirect_to new_my_article_path
        end
    end

    def edit
        @article = MyArticle.find(params[:id])
    end
    
    def update 
        @article.update(my_article_params)
        if @article.valid?
            flash[:notice] = "Article was updated successfully."
            redirect_to my_article_path
        else 
            flash[:errors] = @article.errors.full_messages
            redirect_to edit_my_article_path(@article)
        end
    end

    def destroy
        @article.destroy 
        redirect_to my_articles_path
    end

    private
    def my_article_params
        params.require(:my_article).permit(:title, :description)
    end

    def set_article
        @article = MyArticle.find(params[:id])
    end
end
