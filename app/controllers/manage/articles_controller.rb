class Manage::ArticlesController < Manage::BaseController
  def index
    @articles = Article.search(params[:search],params[:page])

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
    @comm = Comment.new

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @article }
    end
  end

  def create
    @article = Article.new(params[:article])    

    respond_to do |format|
      if @article.save
        format.html { redirect_to(manage_article_path(@article)) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(manage_article_path(@article)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(manage_articles_url) }
      format.xml  { head :ok }
    end
  end


  def comment
    article = Article.find(params[:id])
    if article.comments.create(params[:comment])
      redirect_to :action => "show", :id => params[:id]
    else
      redirect_to :action => "show", :id => params[:id]
    end
  end

  
  def deleteComment
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to(manage_articles_url) }
      format.xml  { head :ok }
    end
  end

end
