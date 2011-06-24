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
    @article = Article.find(params[:id])
    @comm = @article.comments.build(params[:comment])
    if @comm.save
      redirect_to :action => 'show', :id => params[:id]
    else
      @comments = Comment.all
      render :action => 'show', :id => params[:id]
    end
  end

end
