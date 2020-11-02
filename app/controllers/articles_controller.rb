class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all 
  end

  def new 

  end

  def create 
    article = Article.new(articles_params)
    article.save
    redirect_to article_path(article)
  end


  private
  def articles_params 
    params.require(:article).permit(:title,:description)
  end
end