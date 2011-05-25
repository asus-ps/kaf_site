class Manage::HistoriesController < Manage::BaseController
  def index
    if Historie.exists?
      @historie = Historie.find(1)
      respond_to do |format|
        format.html
        format.xml { render :xml => @historie }
      end
    else
      respond_to do |format|
        format.html { redirect_to(new_manage_history_path) }
        format.xml { head :ok }
      end
    end
  end

  def edit
    if Historie.exists?
      @historie = Historie.find(1)
    else
      respond_to do |format|
        format.html {redirect_to(new_manage_history_path) }
        format.xml {head :ok}
      end
    end
  end

  def new
    @historie = Historie.new

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @historie }
    end
  end


  def create
    @historie = Historie.new(params[:historie])
    @historie.id = 1

    respond_to do |format|
      if @historie.save
        format.html { redirect_to(manage_histories_path) }
        format.xml  { render :xml => @historie, :status => :created, :location => @historie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @historie.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @historie = Historie.find(1)

    respond_to do |format|
      if @historie.update_attributes(params[:historie])
        format.html { redirect_to(manage_histories_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @historie.errors, :status => :unprocessable_entity }
      end
    end
  end


end
