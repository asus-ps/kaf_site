class NewsController < ApplicationController
  def index
    @articles = Article.all(:order => 'created_at')
  end

  def show
  end

end
