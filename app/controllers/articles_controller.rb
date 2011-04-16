class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @articles }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @article }
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.all
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @article }
    end
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Новость успешно добавлена!') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kafnews/1
  # PUT /kafnews/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Новость успешно изменена') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kafnews/1
  # DELETE /kafnews/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end

  def comment
    Article.find(params[:id]).comments.create(params[:comment])
    flash[:notice] = "Added your comment"
    redirect_to :action => "show", :id => params[:id]
  end

end
