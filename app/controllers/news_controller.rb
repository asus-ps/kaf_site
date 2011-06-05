class NewsController < ApplicationController
  def index
    @articles = Article.all(:order => 'created_at')
  end

  def show
    @aritcle = Article.find(params[:id])
    @articles = Article.all(:order => 'created_at')
  end

end
