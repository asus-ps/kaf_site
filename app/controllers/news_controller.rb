class NewsController < ApplicationController
  def index
    @articles = Article.all(:order => 'priority desc, created_at desc').paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.all
    @new_comment = Comment.new
  end

  def create_comment
    @article = Article.find(params[:id])
    @new_comment = @article.comments.build(params[:new_comment])

    if @new_comment.save
      redirect_to :action => 'show', :id => params[:id]
    else
      @comments = Comment.all
      render :action => 'show'
    end
  end

end
