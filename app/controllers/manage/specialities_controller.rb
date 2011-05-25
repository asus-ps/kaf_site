class Manage::SpecialitiesController < Manage::BaseController
  def index
    @specialities = Speciality.search(params[:search],params[:page])
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @specialities }
    end
  end

  def edit
    @speciality = Speciality.find(params[:id])
  end

  def new
    @speciality = Speciality.new
    respond_to do |format|
      format.html
      format.xml { render_to :xml => specialities_url }
    end
  end

  def show
  end

  def create
    @speciality = Speciality.new(params[:speciality])

    respond_to do |format|
      if @speciality.save
        format.html { redirect_to(manage_specialities_path) }
        format.xml  { render :xml => manage_specialities_path, :status => :created, :location => @speciality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @speciality.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @speciality = Speciality.find(params[:id])

    respond_to do |format|
      if @speciality.update_attributes(params[:speciality])
        format.html { redirect_to(manage_specialities_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @speciality.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @speciality = Speciality.find(params[:id])
    @speciality.destroy

    respond_to do |format|
      format.html { redirect_to(manage_specialities_url) }
      format.xml  { head :ok }
    end
  end

end
