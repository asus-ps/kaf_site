class CommentsController < ApplicationController
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

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment, :notice => 'Комментарий успешно добавлен!') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kafnews/1
  # PUT /kafnews/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Комментарий успешно изменен') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kafnews/1
  # DELETE /kafnews/1.xml
  def destroy

    respond_to do |format|
      format.html
    end
  end

end
