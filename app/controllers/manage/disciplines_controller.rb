class Manage::DisciplinesController < Manage::BaseController
  def index
    @disciplines = Discipline.all
    @newdiscipline = Discipline.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @discipline }
    end
  end

  def new
  end

  def edit
    @disciplines = Discipline.all
    @newdiscipline = Discipline.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @discipline }
    end
  end


  def create
    @discipline = Discipline.new(params[:discipline])

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to(disciplines_path, :notice => 'Учёная степень была успешно создана') }
        format.xml  { render :xml => @discipline, :status => :created, :location => @discipline }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      if @discipline.update_attributes(params[:discipline])
        format.html { redirect_to(disciplines_path, :notice => 'Учёная степень была успешно изменена') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to(disciplines_url) }
      format.xml  { head :ok }
    end
  end
end
