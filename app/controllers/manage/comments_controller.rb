class Manage::CommentsController < Manage::BaseController
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @comments }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @comment }
    end
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @comment }
    end
  end



  def create
    @comment = Comment.new(params[:comment])
    @comment.article_id = @article

    respond_to do |format|
      if @comment.save
      flash[:notice] = "Ваш комментарий добавлен"
      redirect_to :action => "show", :id => params[:id]
      end
    end
  end


  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(manage_comment_path(@comment), :notice => 'Комментарий успешно изменен') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @hh = @comment.article
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to(manage_article_path(@hh)) }
      format.xml  { head :ok }
    end
  end

end
