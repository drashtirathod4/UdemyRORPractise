class MyArticlesController < ApplicationController
    def index
        @articles = MyArticle.all
    end

    def show
        @article = MyArticle.find(params[:id])
    end

    def new
        @article = MyArticle.new
    end

    def create
        @article = MyArticle.new(params.require(:my_article).permit(:title, :description))
        if @article.valid?
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else 
            flash[:errors] = @article.errors.full_messages
            redirect_to new_my_article_path
        end
    end
end
