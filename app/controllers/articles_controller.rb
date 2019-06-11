class ArticlesController < ApplicationController

def new
  @article = Article.new
 end

# This is my create article method
 def create
   @article = Article.new(article_params)
   if @article.save
    flash[:notice] = "Article was successfully created"
    redirect_to article_path(@article)
   else
    render 'new'
   end
  end

# This is my show article created method
  def show
    @article = Article.find(params[:id])
   end
# This is my edit article method

def edit
  @article = Article.find(params[:id])
end

# This is my update method

def update
  @article = Article.find(params[:id])
  if @article.update(article_params)
   flash[:notice] = "Article was updated"
   redirect_to article_path(@article)
  else
   flash[:notice] = "Article was not updated"
   render 'edit'
  end
 end

 def index
  @articles = Article.all
 end

# This is my destroy action
 def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:notice] = "Article was deleted"
  redirect_to articles_path
 end



# This is my mthod to require a title and description
private
  def article_params
   params.require(:article).permit(:title, :description)
  end
end

def set_article
  @article = Article.find(params[:id])
 end
