class Manage::DegreesController < Manage::BaseController
  def index
    @degrees = Degree.all
    @newdegree = Degree.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @degrees }
    end
  end

  def new
    @degree = Degree.new
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @degree }
    end
  end

  def edit
    @degrees = Degree.all
    @newdegree = Degree.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @degree }
    end
  end


  def create
    @degree = Degree.new(params[:degree])

    respond_to do |format|
      if @degree.save
        format.html { redirect_to(manage_degrees_path, :notice => 'Учёная степень была успешно создана') }
        format.xml  { render :xml => @degree, :status => :created, :location => @degree }
      else
        #format.html { render :action => "index" }
        format.html { redirect_to(manage_degrees_path, :notice => 'Учёная степень не была создана') }
        format.xml  { render :xml => @degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @degree = Degree.find(params[:id])

    respond_to do |format|
      if @degree.update_attributes(params[:degree])
        format.html { redirect_to(manage_degrees_path, :notice => 'Учёная степень была успешно изменена') }
        format.xml  { head :ok }
      else
        #format.html { render :action => "index" }
        format.html { redirect_to(edit_manage_degree_path(@degree), :notice => 'Учёная степень не была изменена') }
        format.xml  { render :xml => @degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @degree = Degree.find(params[:id])
    @degree.destroy

    respond_to do |format|
      format.html { redirect_to(manage_degrees_url) }
      format.xml  { head :ok }
    end
  end
end
