class NewsController < ApplicationController
  def index
    @articles = Article.all(:order => 'priority desc, created_at desc').paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.all
    @comm = Comment.new
  end

  def comment
    article = Article.find(params[:id])
    if article.comments.create(params[:comment])
      redirect_to :action => "show", :id => params[:id]
    else
      redirect_to :action => "show", :id => params[:id]
    end
  end

end
