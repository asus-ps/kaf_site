class Manage::LinksController < Manage::BaseController
  def index
    @links = Link.all
    @newlink = Link.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @links }
    end
  end

  def edit
    @links = Link.all
    @newlink = Link.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @links }
    end
  end

  def new
  end

  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to(links_path, :notice => 'URL was successfully created.') }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to(links_path, :notice => 'URL was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(links_url) }
      format.xml  { head :ok }
    end
  end


end
