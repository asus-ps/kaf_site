class DegreesController < ApplicationController
  def index
    @degrees = Degree.all
    @newdegree = Degree.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @degree }
    end
  end

  def new
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
        format.html { redirect_to(degrees_path, :notice => 'Учёная степень была успешно создана') }
        format.xml  { render :xml => @degree, :status => :created, :location => @degree }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @degree = Degree.find(params[:id])

    respond_to do |format|
      if @degree.update_attributes(params[:degree])
        format.html { redirect_to(degrees_path, :notice => 'Учёная степень была успешно изменена') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @degree = Degree.find(params[:id])
    @degree.destroy

    respond_to do |format|
      format.html { redirect_to(degrees_url) }
      format.xml  { head :ok }
    end
  end
end